class InsightService
	attr_reader :block_hash, :height, :time

	def initialize(block_hash)
		@block_hash = block_hash

		get_block_data
	end
	
	def get_block_data
		request = Typhoeus.get("https://testnet-bitcore3.trezor.io/api/block/#{@block_hash}")
		data = Oj.load(request.body)
		@time = data["time"]
		@height = data["height"]
	end
end