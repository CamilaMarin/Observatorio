class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.integer :id_actor
      t.string :nombre_actor

      t.timestamps
    end
  end
end
