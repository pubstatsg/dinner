class AddEpochTimeToBlocks < ActiveRecord::Migration[5.2]
  def change
    add_column :blocks, :epoch_time, :string
  end
end
