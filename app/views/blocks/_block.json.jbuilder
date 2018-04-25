json.extract! block, :id, :height, :block_hash, :created_at, :updated_at
json.url block_url(block, format: :json)
