json.extract! block, :id, :height, :block_hash, :epoch_time, :created_at, :updated_at
json.url block_url(block, format: :json)
