class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.string :image
      t.string :link
      t.string :username
      t.string :location
      t.string :facebook_uid
      t.string :facebook_token
      t.datetime :facebook_expires_at
      t.string :twitter_uid
      t.string :twitter_token
      t.string :twitter_secret 
      t.string :oauth_token
      t.datetime :oauth_expires_at
 
      t.timestamps
    end
  end
end
