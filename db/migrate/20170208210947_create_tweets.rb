class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :external_id, null: false
      t.string :content, null: false
      t.string :username, null: false
      t.string :avatar
      t.datetime :tweeted_at, null: false

      t.timestamps
    end
  end
end
