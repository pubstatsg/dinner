class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  # GET /blocks
  # GET /blocks.json
  def index
    @blocks = Block.all.order(height: :desc)
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
  end

  # blocknotify=curl --request POST --url http://localhost:3000/block_trigger.json --header 'Content-Type: application/json' --data '{ "block_hash":"%s" }'
  def trigger
    block_data = InsightService.new(params["block_hash"])

    Block.create(
      height: block_data.height,
      block_hash: block_data.block_hash,
      epoch_time: block_data.time
    )

    render json: {status: 200}, status: 200
  end

  # GET /blocks/new
  def new
    @block = Block.new
  end

  # GET /blocks/1/edit
  def edit
  end

  # POST /blocks
  # POST /blocks.json
  def create
    @block = Block.new(block_params)

    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render :show, status: :created, location: @block }
      else
        format.html { render :new }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocks/1
  # PATCH/PUT /blocks/1.json
  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { render :show, status: :ok, location: @block }
      else
        format.html { render :edit }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url, notice: 'Block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:height, :block_hash, :epoch_time)
    end
end
