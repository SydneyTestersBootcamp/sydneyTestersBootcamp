require 'spec_helper'
require 'carPremiumCalculator'
require 'carQuote'

describe CarPremiumCalculator do

  premiumCalculator = CarPremiumCalculator.new()
        
  describe '#getPremiumForQuote' do
    it 'should return right premium for a 23 year old, BMW driver in NSW' do
      quote = CarQuote.new(23, "email@gmail.com", "nsw", "bmw", "male", 2000)
      expect(premiumCalculator.getPremiumForQuote(quote)).to match(/55.54/)
    end
  end
end
