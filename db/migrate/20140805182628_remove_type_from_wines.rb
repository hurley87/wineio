class RemoveTypeFromWines < ActiveRecord::Migration
  def change
  	remove_column :wines, :type
  end
end
