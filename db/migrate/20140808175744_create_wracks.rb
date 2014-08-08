class CreateWracks < ActiveRecord::Migration
  def change
    create_table :wracks do |t|
      t.integer :user_id
      t.integer :wine_id

      t.timestamps
    end
  end
end
