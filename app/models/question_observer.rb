class QuestionObserver < ActiveRecord::Observer 
  def after_create(question)  
    QuestionMailer.deliver_question(question) 
    QuestionMailer.deliver_asker(question) 
  end

end