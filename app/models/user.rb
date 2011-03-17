class User < ActiveRecord::Base
   require 'createsend'
  
  acts_as_authentic do |c|
    c.validate_login_field = false
    #c.logged_in_timeout = 10.minutes
  end

  
  has_many :families
  has_many :homes
  has_many :itineraries
  has_many :lists
  has_many :moves
  has_many :pets
  has_many :things
  has_one :address
  has_one :spouse
  has_one :order
  accepts_nested_attributes_for :pets, :families, :spouse, :address
  
  #attr_accessible :name, :login, :email, :password

  def signup!(params)
      self.email = params[:user][:email]
      self.name = params[:user][:name]
      self.password = params[:user][:password]
      #save_without_session_maintenance
  end
  
  def deliver_welcome!  
    reset_perishable_token!
    UserMailer.deliver_welcome(self)  
  end
  def after_save
     CreateSend.api_key '2f3a2d2d12d547b432ad43dc67c8348d'
     cs = CreateSend::CreateSend.new
     CreateSend::Subscriber.add('24affe79e79fa744191dc57a4f4c0627', 
       self.email, 
       self.name, 
       [:Key => 'Member Created On', :Value => self.created_at] , 
       true
       )
     #cs.add('24affe79e79fa744191dc57a4f4c0627','foo2@bar.com','John Doe')
     
     #cm.list['24affe79e79fa744191dc57a4f4c0627']
     #list = List.new(:list_id => '24affe79e79fa744191dc57a4f4c0627') # or find it via client.lists
    
    
  end 
end
