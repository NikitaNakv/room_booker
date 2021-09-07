class AddStatusToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :status, :boolean
  end
end
