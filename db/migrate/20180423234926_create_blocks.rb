class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.string :height
      t.string :block_hash

      t.timestamps
    end
  end
end
