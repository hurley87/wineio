class RemoveBodyFromReviews < ActiveRecord::Migration
  def change
  	remove_column :reviews, :body
  end
end
