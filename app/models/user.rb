class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :families
  has_many :homes
  has_many :itineraries
  has_many :lists
  has_many :moves
  has_many :pets
  has_one :address
  has_one :spouse
  accepts_nested_attributes_for :pets, :families, :spouse, :address

  def deliver_welcome_email!  
    #reset_perishable_token!
    UserMailer.deliver_welcome_email(self)  
  end

end
