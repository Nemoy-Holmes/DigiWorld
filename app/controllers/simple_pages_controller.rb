class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
  	@Product = Product.limit(3)
  end
end

