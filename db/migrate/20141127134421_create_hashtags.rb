class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.integer :id_hashtag
      t.integer :id_actor
      t.string :nombre_hashtag

      t.timestamps
    end
  end
end
