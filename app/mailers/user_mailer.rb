class UserMailer < ApplicationMailer
	default from: "nemoy.holmes@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: "your-email@example.com",
			subject:"A new contact form #{name}")
	end

	def welcome(user)
		mail(to: user.email, 
			subject: "welcome to Digiworld")
	end
end
