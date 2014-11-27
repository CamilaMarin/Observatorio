class CreatePalabraBolsas < ActiveRecord::Migration
  def change
    create_table :palabra_bolsas do |t|
      t.integer :id_palabrab
      t.string :nombre_palabra
      t.integer :puntaje

      t.timestamps
    end
  end
end
