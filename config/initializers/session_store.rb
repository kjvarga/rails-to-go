# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dispatch_session',
  :secret      => 'e47ae79ca1f773a08818456bae4c524d204f395044078e48f4cad1628f9f9596c0f9c1b20361069428177851ad4aeeb56a436826e742e637a41fbdd5b9de8698'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
