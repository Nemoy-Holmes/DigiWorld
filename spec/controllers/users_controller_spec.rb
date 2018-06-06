require 'rails_helper'

describe UsersController, type: :controller do
 context "checking authorizaton" do
   let(:user) {User.create!(email: "testname", password: "testtest")}
 end

 describe "GET #show" do
   context "when a user logged in" do
     before do
       sign_in user
     end

     it "loads correct user details" do
       get :show, params: {id: user.id}
       expect(response).to eq 200
     end

     it "sets the correct user" do
       expect(assigns(:user)).to eq user
     end
   end

   context "when a user is not loggd in" do
     it "redirects to login" do
       get :show, params: {id: user.id}
       expect(response).to redirect_to(new_user_session_path)  
     end
   end
 end
end