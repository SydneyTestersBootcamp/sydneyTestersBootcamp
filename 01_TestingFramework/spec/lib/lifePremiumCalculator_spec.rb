require 'spec_helper'
require 'lifePremiumCalculator'
require 'lifeQuote'

describe LifePremiumCalculator do

  premiumCalculator = LifePremiumCalculator.new()
        
  describe '#getPremiumForQuote' do
    it 'should return right premium for a 23 year old, high risk male in NSW' do
      quote = LifeQuote.new(23, "email@gmail.com", "nsw", "risk2", "male")
      expect(premiumCalculator.getPremiumForQuote(quote)).to match(/55.54/)
    end
  end
end
