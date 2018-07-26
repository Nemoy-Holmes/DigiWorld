class UserMailer < ApplicationMailer
	default from: "nemoy.holmes@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: "nemoy.holmes@gmail.com",
			subject:"A new contact form #{name}")
	end

	def welcome(user)
		mail(to: user.email, 
			subject: "welcome to Digiworld")
	end

	def order_placed (order, user)
		@product = order.product
		@order = order
		@user = user 
		mail(to: user.email, 
			subject: "thanks for your purchase of #{@product}")
	end
end
