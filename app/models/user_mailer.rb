class UserMailer < ActionMailer::Base
   def welcome_email(user)  
     recipients user.email 
     from "MilitaryMoveIt <militarymoveit@gmail.com>"  
     subject "Welcome to My Awesome Site"  
     sent_on Time.now 
     body :user => user
  end 
end
