class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :location
      t.string :winery
      t.string :type
      t.string :link
      t.string :vintage
      t.string :price
      t.string :varietal
      t.string :note
      t.string :image

      t.timestamps
    end
  end
end
