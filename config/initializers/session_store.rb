# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_usainet_fax_session',
  :secret      => 'c83e074c0eee2130717c2b86c4a011274beecd593e6ed442a8bd2fde0270abd53f8fb84a413c3e92bb30c3fbde63b306b463fc9c2938fbb1cd1486749fe8049c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
