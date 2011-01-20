class UserMailer < ActionMailer::Base
   def welcome(user)  
     recipients user.email 
     from "militarymoveit@gmail.com"  
     subject "Welcome to MilitaryMoveIt" 
     cc "militarymoveit@gmail.com"
     body :user => user 
  end 
end
