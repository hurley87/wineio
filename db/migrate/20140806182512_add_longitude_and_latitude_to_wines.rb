class AddLongitudeAndLatitudeToWines < ActiveRecord::Migration
  def change
  	add_column :wines, :longitude, :float
  	add_column :wines, :latitude, :float
  end
end
