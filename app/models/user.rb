class User < ActiveRecord::Base
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

end
