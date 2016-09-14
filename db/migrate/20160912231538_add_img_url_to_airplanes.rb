class AddImgUrlToAirplanes < ActiveRecord::Migration[5.0]
  def change
    add_column :airplanes, :img_url, :string
  end
end
