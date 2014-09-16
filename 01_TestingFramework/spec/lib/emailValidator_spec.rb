require 'spec_helper'
require 'emailValidator'

describe EmailValidator do

  let (:emailValidator) {EmailValidator.new()}

  describe '#isEmailValid?' do
    
    it 'should return false if there is no "."' do
      expect(emailValidator.isEmailValid?("hans@gmail")).to be false
    end
    
    it 'should return false if there is no username' do
      expect(emailValidator.isEmailValid?("@gmail.com")).to be false
    end
        
    it 'should return false if there is no "@"' do
      expect(emailValidator.isEmailValid?("hans.com")).to be false
    end

    it 'should return false if there is only one character "@"' do
      expect(emailValidator.isEmailValid?("@")).to be false
    end
    
    it 'should return false if there is no "@" or dot' do
      expect(emailValidator.isEmailValid?("hans")).to be false
    end
    
    it 'should return false if there is no domain name' do
      expect(emailValidator.isEmailValid?("hans@gmail.")).to be false
    end
    
    it 'should return false if email is blank' do
      expect(emailValidator.isEmailValid?("")).to be false
    end
    
    it 'should return true if email is proper' do
      expect(emailValidator.isEmailValid?("hans@gmail.com")).to be true
    end
    
    it 'should return true if email is has more than one domain' do
      expect(emailValidator.isEmailValid?("hans@rta.nsw.gov.au")).to be true
    end

    it 'should return true if email is in uppercase' do
      expect(emailValidator.isEmailValid?("HANS@GMAIL.COM")).to be true
    end

    it 'should return true if email has some special characters' do
      expect(emailValidator.isEmailValid?("hans_raj@o'connell.com")).to be true
    end
    
  end
end
