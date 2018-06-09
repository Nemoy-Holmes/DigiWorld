require 'rails_helper'

describe UsersController, type: :controller do
 before do
    #@user = User.create!(email: "test@testing.co", password: "testtest")
    #@user2 = User.create!(email: "test1@testing.co", password: "timeforatest")
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
 end
 
  describe "GET #show" do
    context "when a user is logged in" do
        before do
          sign_in @user
        end
        it "loads the correct user details" do
          get :show, params: {id: @user.id}
          expect(assigns(:user)).to eq @user
          expect(response).to have_http_status(200)
        end
        context "cannot access second user show page" do
          it "redirects to root" do
            get :show, params: { id: @user2.id }
            expect(response).to have_http_status(200)
            expect(assigns(:user)).to eq @user2
          end
        end
    end

      
      context "No user is logged in" do
        it "redirects to login" do
          get :show, params: { id: @user.id }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
      
      
  end
end