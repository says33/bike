class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.float :price
      t.string :count

      t.timestamps
    end
  end
end
