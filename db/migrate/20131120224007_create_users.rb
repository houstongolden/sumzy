class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :link
      t.string :username
      t.string :user_location
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
