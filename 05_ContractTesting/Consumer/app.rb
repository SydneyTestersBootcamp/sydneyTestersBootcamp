require 'sinatra'
require 'haml'
require 'json'
require 'coffee-script'
require 'carQuote'
require 'lifeQuote'
require 'lifePremiumCalculator'
require 'emailValidator'
require 'rack-google-analytics'
require 'logger'
require "warden"

require 'data_mapper'
require 'bcrypt'
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/db.sqlite")

require './models/policies'
require './models/users'
DataMapper.finalize
DataMapper.auto_migrate!


use Rack::GoogleAnalytics, :tracker => 'UA-53462613-1'

configure :production do
  require 'newrelic_rpm'
end

class App < Sinatra::Base
  
  logger = Logger.new(STDERR)
  emailValidator = EmailValidator.new()

  #configure do
  #  Dir.mkdir('log') unless File.exists?('log')
  #  enable :logging
  #  log_file = File.new('log/access.log', 'a+')
  #  log_file.sync = true
  #  use Rack::CommonLogger, log_file
  #end
  
  use Rack::Session::Cookie, :key => 'rack.session',
                               :path => '/',
                               :secret => 'secret_stuff'
  
  use Warden::Manager do |config|
    config.serialize_into_session{|user| user.id }
    config.serialize_from_session{|id| User.get(id) }

    config.scope_defaults :default,
      strategies: [:password],
      action: 'auth/unauthenticated'
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env,opts|
    env['REQUEST_METHOD'] = 'POST'
  end
  
  Warden::Strategies.add(:password) do
    def valid?
      params['user']['username'] && params['user']['password']
    end

    def authenticate!
      user = User.first(username: params['user']['username'])

      if user.nil?
        fail!("The username you entered does not exist.")
      elsif user.authenticate(params['user']['password'])
        success!(user)
      else
        fail!("Could not log in")
      end
    end
  end

  get '/' do
    session["quote"] ||= nil
    haml :index
  end
  
  get '/seed' do
    createUser("hans@hans.com", "hans", "Hans", "ADMIN")
    createUser("hansrd@hans.com", "hans", "Hans RD", "ADMIN")
    redirect '/users'
  end
  
  get "/bad" do
    content_type :json
    { :login_successful => "false" }.to_json
  end
  
  get "/good" do
    content_type :json
    { :login_successful => "true", :name => "Hans"}.to_json
  end

  get '/landing' do
    session["quote"] ||= nil
    haml :landing
  end

  get '/life' do
    sleep 0.5
    haml :life
  end
  
  get '/car' do
    haml :car
  end
  
  get '/payment' do
    @quote = session["quote"]
    haml :payment
  end

  post '/landing' do
    haml :landing
  end
  
  get '/users' do
    @users = User.all
    haml :users
  end
  
  get '/policies' do
    @policies = Policy.all
    haml :policies
  end
  
  post '/pay' do
    #logger.info params
    @quote = session["quote"]
    createUser(params["username"], params["password"], params["cardholdername"], "USER")
    # Create insurance policy in DB
    haml :done
  end
  
  post '/quote' do
    #logger.info params
    type = params["typeOfInsurance"]
    if type == "life"
      @quote = getLifeQuote(params)
    else
      @quote = getCarQuote(params)
    end
    session["quote"] = @quote
    haml :quote
  end
  
  post '/checkemail' do
    #logger.info params
    email = params["email"]
    content_type :json
    {:valid => emailValidator.isEmailValid?(email)}.to_json
  end
  
  get '/javascripts/application.js' do
    coffee :application
  end
  
  not_found do
    haml :not_found
  end
  
  def getLifeQuote(params)
    age = params["age"]
    email = params["email"]
    occupationCategory = params["occupation"]
    gender = params["gender"]
    state = params["state"]
    LifeQuote.new(age, email, state, occupationCategory, gender)
  end
  
  def getCarQuote(params)
    age = params["age"]
    email = params["email"]
    make = params["make"]
    year = params["year"]
    gender = params["gender"]
    state = params["state"]
    CarQuote.new(age, email, state, make, gender, year)
  end

  def createUser(username, password, name, role)
    if !User.get(:username => username)
      User.create(:role=>role, :username=>username, :password=>password, :name => name)
    end
  end
  
  def createPolicy(quote, user)
    # Create Policy in DB
  end
  
end