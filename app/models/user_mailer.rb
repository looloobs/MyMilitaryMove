class UserMailer < ActionMailer::Base
   def welcome(user)  
     recipients user.email 
     from "militarymoveit@gmail.com"  
     subject "Welcome to MilitaryMoveIt" 
     body :user => user 
  end 
end
