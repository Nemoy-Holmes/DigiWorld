class UserMailer < ApplicationMailer
	default from: "nemoy.holmes@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: "your-email@example.com",
			subject:"A new contact form #{name}")
	end
	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message= params[:message]
		UserMailer.contact(@email, @name, @message).deliver_now
	end
end
