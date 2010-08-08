class UserObserver < ActiveRecord::Observer 
  def after_save(user)  
    UserMailer.deliver_welcome_email(user)  
  end 
end 
