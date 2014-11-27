class CreateTextos < ActiveRecord::Migration
  def change
    create_table :textos do |t|
      t.integer :id_tweet
      t.integer :id_texto
      t.text :texto

      t.timestamps
    end
  end
end
