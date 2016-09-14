class CreateAirplanes < ActiveRecord::Migration[5.0]
  def change
    create_table :airplanes do |t|
      t.string :name
      t.float :price
      t.string :desc

      t.timestamps
    end
  end
end
