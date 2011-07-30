namespace :db do
  task :seed => :environment do
    User.destroy_all
    [ { :login => 'usai-fax',   :password => 'usa1faxm3', :password_confirmation => 'usa1faxm3', :is_admin => false },
      { :login => 'usai-admin', :password => 'danc1ng',   :password_confirmation => 'danc1ng',   :is_admin => true  },
    ].each {|user_attributes| User.create!(user_attributes) }
  end
end