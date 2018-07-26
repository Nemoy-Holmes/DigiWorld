class OrdersController < ApplicationController

	before_action :authenticate_user!

	
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_url, :alert => exception.message
	end 

	def index
		if current_user.admin?
			@orders = Order.includes(:product, :user).all
		else
			@orders = Order.includes(:product, :user).where(user_id: current_user.id).all
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
	end

	def create
		@product = Product.find(params[:product_id])
		@order = @product.orders.build(product: @product)
		@order.user = current_user
		@order.total = @product.price

		if @order.save 
			redirect_to order_path(@order)
			flash[:notice] = "order placed successfully!"
		else
			flash[:error] = "Sorry, something went wrong!"
		end
	end

	def destroy
	end
			
end