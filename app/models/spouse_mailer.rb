class SpouseMailer < ActionMailer::Base
  def welcome_email(spouse)  
    recipients spouse.email 
    from "notifications@example.com"  
    subject "Welcome to My Awesome Site"  
  end 

end
