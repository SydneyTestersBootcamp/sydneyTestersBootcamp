require 'pact'
require './pricing_service'

Pact.service_provider 'Pricing Service' do
end

Pact.provider_states_for 'Website' do
	provider_state 'normal' do
		set_up do
			:no_op
		end
	end
end