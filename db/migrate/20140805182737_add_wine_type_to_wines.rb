class AddWineTypeToWines < ActiveRecord::Migration
  def change
  	add_column :wines, :wine_type, :string
  end
end
