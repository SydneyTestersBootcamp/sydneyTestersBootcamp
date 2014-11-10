require 'pact'
require './pricing_service'

Pact.service_provider 'Pricing Service' do
	honours_pact_with 'Website' do
	    pact_uri '../Consumer/spec/pacts/website-pricing_service.json'
	end
end

Pact.provider_states_for 'Website' do
	provider_state 'normal' do
		set_up do
			:no_op
		end
	end
end

