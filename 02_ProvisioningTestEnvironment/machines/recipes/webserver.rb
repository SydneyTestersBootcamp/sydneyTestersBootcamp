service 'apache2' do
	init_command '/etc/init.d/apache2'
	action :restart
end

directory "/var/www/sydneytester" do
  action :create
end

file '/var/www/sydneytester/index.php' do
	content "<?php echo '<h1>Hello SydneyTester</h1>'; ?>"
	action :create
end
