class CreatePalabraClaves < ActiveRecord::Migration
  def change
    create_table :palabra_claves do |t|
      t.integer :id_palabra
      t.integer :id_actor
      t.string :nombre_palabra_clave

      t.timestamps
    end
  end
end
