class QuestionMailer < ActionMailer::Base
   def question(question)  
     recipients question.to
     from "militarymoveit@gmail.com" 
     reply_to question.from
     subject "You have a question from MilitaryMoveIt" 
     cc "militarymoveit@gmail.com"
     body :question => question 
  end 
end

