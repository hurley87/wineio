class AddBodyAndUserIdAndWinIdToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :body, :text
  	add_column :reviews, :user_id, :integer
  	add_column :reviews, :wine_id, :integer
  end
end
