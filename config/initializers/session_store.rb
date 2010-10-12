# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_together_session',
  :secret      => 'fb6cdccdc6b8066f42500d87833254428b6deeb36f94535c163a13ea86510c9a719b1ef4c7f0bc0494730396f1e78cde8da0dac3d5397142937b61b256c438f8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
