class CreateActorTweets < ActiveRecord::Migration
  def change
    create_table :actor_tweets do |t|
      t.integer :id_at
      t.integer :id_actor
      t.integer :id_tweet

      t.timestamps
    end
  end
end
