class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :id_tweet
      t.integer :id_texto
      t.integer :id_usuario
      t.string :region
      t.date :fecha
      t.string :clasificacion

      t.timestamps
    end
  end
end
