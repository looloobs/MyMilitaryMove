class UserObserver < ActiveRecord::Observer 
  def after_save(self)  
    #reset_perishable_token!
    UserMailer.deliver_welcome_email(self)  
  end 
end 
