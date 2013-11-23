class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_email
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url
      t.string :linkedin_url
      t.string :youtube_url
      t.string :soundcloud_url
      t.string :pinterest_url
      t.string :tumblr_url
      t.text :bio
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id

      t.timestamps
    end
  end
end
