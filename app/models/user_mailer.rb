class UserMailer < ActionMailer::Base
   def welcome(user)  
     recipients user.email 
     from "militarymoveit@gmail.com"  
     subject "Welcome to My Awesome Site"  
  end 
end
