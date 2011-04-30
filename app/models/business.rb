class Business < ActiveRecord::Base
   acts_as_authentic do |c|
         #c.my_config_option = my_value  for available options see documentation in: Authlogic::ActsAsAuthentic
         #c.validate_login_field = false
   end # block optional
   
end
