class RemovepasskeyFromUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :passkey, :string
  end
end
