class CreateWineRacks < ActiveRecord::Migration
  def change
    create_table :wine_racks do |t|
      t.integer :user_id
      t.integer :wine_id

      t.timestamps
    end
  end
end
