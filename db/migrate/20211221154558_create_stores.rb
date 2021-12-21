class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :nombre
      t.string :direccion
      t.integer :telefono

      t.timestamps
    end
  end
end
