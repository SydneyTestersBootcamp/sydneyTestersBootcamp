class Policy
    include DataMapper::Resource
    
    property :policynum,      Serial
    property :type,     String,   :required => true
    property :userid,         String,   :required => true,  :format => :email_address
    property :quote,          Text,     :required => true
    property :createdtime,    DateTime, :required => true
    property :updatedtime,    DateTime, :required => true
    
    belongs_to :user
end