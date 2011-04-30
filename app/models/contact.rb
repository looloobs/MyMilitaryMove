class Contact < ActiveRecord::Base
   belongs_to :installation
   has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   /def after_save
      CreateSend.api_key '2f3a2d2d12d547b432ad43dc67c8348d'
      cs = CreateSend::CreateSend.new
      CreateSend::Subscriber.add('e062274a167a253da1997827592bfd64', 
        self.email, 
        self.name, 
        [:Key => 'Member Created On', :Value => self.created_at] , 
        true
        )
      #cs.add('24affe79e79fa744191dc57a4f4c0627','foo2@bar.com','John Doe')

      #cm.list['24affe79e79fa744191dc57a4f4c0627']
      #list = List.new(:list_id => '24affe79e79fa744191dc57a4f4c0627') # or find it via client.lists


   end/
end
