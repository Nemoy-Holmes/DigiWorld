class PaymentsController < ApplicationController
  
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i,
        currency: "usd",
        source: token,
        receipt_email: params[:stripeEmail],
        description: params[:stripeEmail]
        
      )

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
        flash[:success] = "Your payment was processed successfully"
      end

      

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product)
  end
end