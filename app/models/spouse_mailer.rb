class SpouseMailer < ActionMailer::Base
  def welcome_email(spouse)  
    recipients spouse.email 
    from "notifications@example.com"  
    subject "Welcome to My Awesome Site"  
    sent_on Time.now 
    body :spouse => spouse
  end 

end
