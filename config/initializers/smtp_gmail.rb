ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => :password,
  :enable_starttls_auto => true,
  :user_name => "militarymoveit@gmail.com",
  :password => "lroth.101"
}
