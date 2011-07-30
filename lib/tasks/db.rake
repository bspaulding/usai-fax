namespace :db do
  task :seed => :environment do
    [ { :login => 'usai-fax',   :password => 'usa1faxm3', :password_confirmation => 'usa1faxm3' },
      { :login => 'usai-admin', :password => 'danc1ng',   :password_confirmation => 'danc1ng'   },
    ].each {|user_attributes| User.create!(user_attributes) }
  end
end