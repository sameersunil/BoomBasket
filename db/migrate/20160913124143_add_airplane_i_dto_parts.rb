class AddAirplaneIDtoParts < ActiveRecord::Migration[5.0]
  def change
  	add_column :parts, :airplane_id, :integer
  end
end
