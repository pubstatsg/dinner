class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :platform
      t.string :player_id
      t.string :region

      t.timestamps
    end
  end
end
