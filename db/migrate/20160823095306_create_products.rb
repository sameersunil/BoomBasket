class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :cat
      t.string :name
      t.integer :price
      t.string :img_url

      t.timestamps
    end
  end
end
