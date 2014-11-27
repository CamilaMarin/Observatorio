class CreateTextoPalabras < ActiveRecord::Migration
  def change
    create_table :texto_palabras do |t|
      t.integer :id_tp
      t.integer :id_texto
      t.integer :id_palabrab

      t.timestamps
    end
  end
end
