class UserSession < Authlogic::Session::Base
  logout_on_timeout false
  
  attr_accessor :new_installation_name
    before_save :create_installation_from_name

    def create_installation_from_name
       unless new_installation_name.blank?
          if installation = Installation.find(:first, :conditions => {:name => new_installation_name}) then
             self.installation_id = installation_id
          else
             create_installation(:name => new_installation_name)
          end
       end
    end
end