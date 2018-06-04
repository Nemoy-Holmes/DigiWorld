require 'rails_helper'
describe "Product" do
    context "when the product has comments" do
        let(:product) {Product.create!(name:"testtest")}
        let(:user) {User.create!(email: "something@gmail.com", password: "testtest")}   

        before do
            product.comments.create!(rating: 1, user: user, body: "Awful")
            product.comments.create!(rating: 2, user: user, body: "meh")
            product.comments.create!(rating: 3, user: user, body: "cool")
        end    
        it "returns the average rating of all comments" do
            expect(product.comments.average(:rating).to_i).to eq 2
        end
        it "is not valid without a name" do
            expect(Product.new(description: "nice bike")).not_to be_valid

        end
    end  
end
