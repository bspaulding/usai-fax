class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :login
      t.string  :crypted_password
      t.string  :password_salt
      t.string  :persistence_token
      t.integer :login_count
      t.integer :failed_login_count
      t.last_request_at :datetime
      t.current_login_at :datetime
      t.last_login_at :datetime
      t.current_login_ip :string
      t.last_login_ip :string
      t.boolean :is_admin

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
