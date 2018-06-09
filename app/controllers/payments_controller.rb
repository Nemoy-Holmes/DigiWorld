class PaymentsController < ApplicationController
    def create
        @product = params[:product_id]            
        @user = current_user
            token = params[:stripeToken]
            #create charge on the stripe servers- this will chare the user card

        begin
            charge = Stripe::Charge.create (
                amount: @product.price, #amount in cents again
                currency: "usd",
                source: token,
                description: params[:stripeEmail]
            )
            if charge.paid
                Order.create()
            end

        rescue => Stripe::CardError => e
            #the card has been declined
            body = e.json_body
            err = body[:error]
            flash[:error] = "unfortunately, there was an error processing you payment: #{err[:message]}"
                
        end
        redirect_to product_path(@product)
    end
end
