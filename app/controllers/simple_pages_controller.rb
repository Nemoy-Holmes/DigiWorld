class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
  	@products = Product.limit(3)
  end

  def contact
  end
  def about
  end 
  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	#ActionMailer::Base.mail(from: @email, to: "nemoy.holmes@gmail.com",
  	#	subject: "A new contact form #{@name}",
    #	body: @message).deliver_now
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end

