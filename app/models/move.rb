class Move < ActiveRecord::Base
  belongs_to :users
  has_many :researches
  has_many :itineraries
  has_many :trips
  has_many :families
  has_many :communities
  has_many :neighborhoods, :through => :communities
  accepts_nested_attributes_for :communities
  
  has_many :events
  has_many :lists
  has_many :notes
  accepts_nested_attributes_for :itineraries
  
  has_one :start
  has_one :installation, :through => :start 
  accepts_nested_attributes_for :start
  
  has_one :installation
  accepts_nested_attributes_for :installation
  
  has_one :end
  has_one :installation, :through => :end 
  
  accepts_nested_attributes_for :end
  accepts_nested_attributes_for :lists

  def after_save

     CreateSend.api_key '2f3a2d2d12d547b432ad43dc67c8348d'
     cs = CreateSend::CreateSend.new
     user = User.find_by_id(user_id)
     email = user.email
     CreateSend::Subscriber.add('24affe79e79fa744191dc57a4f4c0627', 
       email, 
       user.name, 
       [{:Key => 'Move Created On', :Value => DateTime.now},
        {:Key => 'Moving From', :Value => self.end.installation.name},
        {:Key => 'Moving To', :Value => self.start.installation.name},
        {:Key => 'Move Date', :Value => self.date}
       ] , 
       true
       )
    
  end

end
