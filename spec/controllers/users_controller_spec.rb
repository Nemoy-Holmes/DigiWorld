require 'rails_helper'

describe UsersController, type: :controller do
 before do
  # @user = User.create!(email: "test@testing.co", password: "testtest")
  # @user1 = User.create!(email: "test1@testing.co", password: "timeforatest")
  @user = FactoryBot.create(:user)
  @user1 = FactoryBot.create(:user)
 end
 
 describe "GET #show" do
   context "User is logged in" do
     before do
       it "loads the correct user details" do
         expect(response).to have_http_status(200)
         expect(assign(:user)).to eq @user
       end
     end
   end
   
   context "No user is logged in" do
     it "redirects to login" do
       get :show, params: { id: @user.id }
       expect(response).to redirect_to(new_user_session_path)
     end
   end
   
   context "cannot access second user show page" do
     it "redirects to root" do
       get :show, params: { id: @user1.id }
       expect(response).to have_http_status(302)
       expect(response).to redirect_to(new_user_session_path)
     end
   end
 end
end