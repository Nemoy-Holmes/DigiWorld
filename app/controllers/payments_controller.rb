class PaymentsController < ApplicationController
  before_action :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end 
  
  require 'stripe'
  
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i,
        currency: "usd",
        source: token,
        description: @product.description,
        receipt_email: params[:stripeEmail],
        description: params[:stripeEmail]
        
      )

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price.to_i
          flash[:success] = "Your payment was processed successfully! #{@product.name}"
      end
        )
      

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product), notice: "#{@product.name} has been purchased successfully!"
  end
end