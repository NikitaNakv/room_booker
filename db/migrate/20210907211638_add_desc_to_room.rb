class AddDescToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :desc, :text
  end
end
