class UserRegistrationController < Devise::RegistrationsController
    def create 
        super
        if @user.persisted?
            UserMail.welcome(@user).deliver_now
        end
        
    end
    
end
