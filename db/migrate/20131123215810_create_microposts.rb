class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :profile_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
