require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'parallel_tests/tasks'

RSpec::Core::RakeTask.new(:unit)

Cucumber::Rake::Task.new(:e2e) do |t|
  t.cucumber_opts = "features --tags ~@ignore --format pretty"
end

task :headless do
  ENV['USE_HEADLESS_MODE'] = "true"
  ENV['RUN_TESTS_PARALLELY'] = "false"
  ENV['TEST_AGAINST_QA_ENV'] = "false"
  Rake::Task['e2e'].invoke
end

task :chrome do
  ENV['USE_HEADLESS_MODE'] = "false"
  ENV['RUN_TESTS_PARALLELY'] = "false"
  ENV['TEST_AGAINST_QA_ENV'] = "false"
  Rake::Task['e2e'].invoke
end

task :headlessparallel do
  ENV['USE_HEADLESS_MODE'] = "true"
  ENV['RUN_TESTS_PARALLELY'] = "true"
  ENV['TEST_AGAINST_QA_ENV'] = "false"
  Rake::Task['parallel:features'].invoke
end

task :chromeparallel do
  ENV['USE_HEADLESS_MODE'] = "false"
  ENV['RUN_TESTS_PARALLELY'] = "true"
  ENV['TEST_AGAINST_QA_ENV'] = "false"
  Rake::Task['parallel:features'].invoke
end

task :qa_chrome do
  ENV['USE_HEADLESS_MODE'] = "false"
  ENV['RUN_TESTS_PARALLELY'] = "false"
  ENV['TEST_AGAINST_QA_ENV'] = "true"
  Rake::Task['e2e'].invoke
end

task :qa_headless do
  ENV['USE_HEADLESS_MODE'] = "true"
  ENV['RUN_TESTS_PARALLELY'] = "false"
  ENV['TEST_AGAINST_QA_ENV'] = "true"
  Rake::Task['e2e'].invoke
end

task :qa_chromeparallel do
  ENV['USE_HEADLESS_MODE'] = "false"
  ENV['RUN_TESTS_PARALLELY'] = "true"
  ENV['TEST_AGAINST_QA_ENV'] = "true"
  Rake::Task['parallel:features'].invoke
end

task :qa_headlessparallel do
  ENV['USE_HEADLESS_MODE'] = "true"
  ENV['RUN_TESTS_PARALLELY'] = "true"
  ENV['TEST_AGAINST_QA_ENV'] = "true"
  Rake::Task['parallel:features'].invoke
end

task :default => [:unit, :headless]

