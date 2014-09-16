require File.dirname(__FILE__) + '/spec_helper'
set :environment, :test
 
describe "QuickQuote App" do
  include Rack::Test::Methods
 
  def app
    @app ||= App.new
  end
 
  # Do a root test
  it "should respond to /" do
    get '/'
    expect(last_response).to be_ok
  end
end