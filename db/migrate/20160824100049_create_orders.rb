class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.float :total
      t.string :summary

      t.timestamps
    end
  end
end
