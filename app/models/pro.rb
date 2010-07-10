class Pro < ActiveRecord::Base
  belongs_to :positive, :polymorphic => true 
end
