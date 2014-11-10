require './lib/carQuote'
require 'rspec'
require './spec/pact_helper'

describe 'CarQuote', pact: true do
	it 'should get the price' do
		pricing_service
			.given('normal')
			.upon_receiving('a valid request for a price')
			.with(method: :get, path: '/price', query: 'age=30&gender=female&make=audi&state=nsw')
			.will_respond_with(
				status: 200,
				headers: {"Content-Type" => "application/json"},
				body: {
					price: 55.54
				}
			)

		quote = CarQuote.new(30, 'example@example.com', 'nsw', 'audi', 'female', 2014)
		expect(quote.premium).to eq(55.54)
	end
end