class AddImgUrlToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :img_url, :string
  end
end
