require 'pact/consumer/rspec'

Pact.service_consumer 'Website' do
	has_pact_with 'Pricing Service' do
		mock_service :pricing_service do
			port 4567
		end
	end
end