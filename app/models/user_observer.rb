class UserObserver < ActiveRecord::Observer 
  def after_save(user)  
    reset_perishable_token!
    UserMailer.deliver_welcome_email(user)  
  end 
end 
