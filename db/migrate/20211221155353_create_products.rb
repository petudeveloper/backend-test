class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :image
      t.string :nombre
      t.string :codigo
      t.integer :precio
      t.text :descripcion
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
