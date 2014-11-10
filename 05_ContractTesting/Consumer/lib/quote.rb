
class Quote
  
  attr_reader :type, :age, :email, :gender, :state
  
  @@states = {"nsw" => "New South Wales", "vic" => "Victoria", "tas" => "Tasmania", "wa" => "Western Australia", "sa" => "South Australia", "qld" => "Queensland"}
  @@genders = {"male" => "Male", "female" => "Female"}
  @@types = {"life" => "Life Insurance", "car" => "Car Insurance"}
    
  def initialize(type, age, email, state, gender)
    @type = type
    @age = age.to_i
    @email = email
    @state = state
    @gender = gender
  end
  
  def namedState
    @@states[@state]
  end
  
  def namedGender
    @@genders[@gender]
  end
  
  def namedType
    @@types[@type]
  end
  
end