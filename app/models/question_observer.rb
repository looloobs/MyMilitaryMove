class QuestionObserver < ActiveRecord::Observer 
  def after_create(question)  
    QuestionMailer.deliver_question(question)  
  end
end