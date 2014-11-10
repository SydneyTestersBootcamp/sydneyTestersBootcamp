require 'sinatra'
require 'json'

get '/' do
	'Pricing Service'
end

class CarPremiumCalculator

  def initialize
    @basePremium = 10
    @ageFactor = 1.2
    @genderFactors = {"male" => 1.25, "female" => 1.15}
    @stateFactors = {"nsw" => 1.1, "vic" => 1.2, "sa" => 1.3, "wa" => 1.4, "tas" => 1.5, "qld" => 1.6}
    @makeFactors = {"audi" => 1.0, "alfa" => 1.1, "bmw" => 1.2, "lexus" => 1.3, "toyota" => 1.4, "vw" => 1.5}
  end

  def getPremiumForQuote(age, gender, state, make)
    ('%.2f'%(@basePremium + @ageFactor*age*@genderFactors[gender]*@stateFactors[state]*@makeFactors[make]))
  end
  
end

get '/price' do
	age = params[:age].to_f
	gender = params[:gender]
	state = params[:state]
	make = params[:make]
	calc = CarPremiumCalculator.new
	
	value = calc.getPremiumForQuote(age, gender, state, make)

	{
		price: value.to_f
	}.to_json
end