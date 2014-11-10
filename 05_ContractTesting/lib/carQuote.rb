require 'quote'
require 'net/http'
require 'json'

class CarQuote < Quote
  
  attr_reader :year, :make, :premium
  
  @@makes = {"audi" => "Audi", "alfa" => "Alfa Romeo", "bmw" => "BMW", "lexus" => "Lexus", "toyota" => "Toyota", "vw" => "Volkswagen"}
    
  def initialize(age, email, state, make, gender, year)
    @age = age.to_i
    @email = email
    @state = state
    @make = make
    @gender = gender
    @year = year
    super("car", @age, @email, @state, @gender)
    @premium = get_premium
  end
  
  def namedMake
    @@makes[@make]
  end

  def get_premium
    response = JSON.parse Net::HTTP.get URI.parse "http://localhost:4567/price?age=#@age&gender=#@gender&make=#@make&state=#@state"
    response['price']
  end
  
end