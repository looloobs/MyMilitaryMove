class Con < ActiveRecord::Base
   belongs_to :negative, :polymorphic => true
end
