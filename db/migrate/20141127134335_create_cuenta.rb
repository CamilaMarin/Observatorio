class CreateCuenta < ActiveRecord::Migration
  def change
    create_table :cuenta do |t|
      t.integer :id_cuenta
      t.integer :id_actor
      t.string :nombre_cuenta
      t.string :cantidad_seguidores

      t.timestamps
    end
  end
end
