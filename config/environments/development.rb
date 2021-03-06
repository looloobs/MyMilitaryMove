# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.default_content_type = "text/html"
config.action_mailer.raise_delivery_errors = true
config.action_mailer.perform_deliveries = true
config.action_mailer.smtp_settings = {
  :address => "mail-gw.frgcms.com",
  :port => 25,
  :domain => "frgcms.com",
  }
config.action_mailer.delivery_method = :smtp
config.action_mailer.default_url_options = { :host => "frgcms.com" }


config.after_initialize do
  ActiveMerchant::Billing::Base.mode = :test
  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
    :login => "militarymoveit_api1.gmail.com",
    :password => "787UD3KRWNV24QPY",
    :signature => "A-yiJEVBh8yLP9Edia6KWBXPXCz1AHfksu85jFHPWaki7O-7LwGn8Rl0"
  )
end
