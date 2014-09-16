class User
    include DataMapper::Resource
    include BCrypt
    
    property :id, Serial
    property :username, String,     :required => true, :format => :email_address
    property :password, BCryptHash, :required => true, :length => 4..255
    property :name,     String
    property :role,     String,     :required => true, :default => "USER"
    
    has n, :policies
    
    def authenticate(attempted_password)
      if self.password == attempted_password
        true
      else
        false
      end
    end
    
end