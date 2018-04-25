class PageController < ApplicationController
  def home
  	@current_block = Block.last
  end
end
