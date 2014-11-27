class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.integer :id_usuario
      t.string :cuenta

      t.timestamps
    end
  end
end
