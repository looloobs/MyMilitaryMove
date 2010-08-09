class SpouseObserver < ActiveRecord::Observer 
  def after_save(spouse)  
    SpouseMailer.deliver_welcome_email(spouse)  
  end
end 