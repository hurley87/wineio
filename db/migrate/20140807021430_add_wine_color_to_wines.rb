class AddWineColorToWines < ActiveRecord::Migration
  def change
  	add_column :wines, :wine_color, :string
  end
end
