class Interview < ActiveRecord::Base
   has_many :interview_comments
   belongs_to :real_estate
   belongs_to :question
   belongs_to :installation
   accepts_nested_attributes_for :interview_comments
end
