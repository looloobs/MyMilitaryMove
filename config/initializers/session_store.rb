# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mymove_session',
  :secret      => 'd99d231b2e58188bf1aaea0651cb035ed480ebaec62016095b83120ac70792c4a7f058a12b011cd5a2fac5c5af16bad0d28570eb3f10249e8f00117b8aa50c5a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
