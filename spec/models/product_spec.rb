require 'rails_helper'

describe Product do
 before do
   @product = Product.create!(name: "Race Bike")
   @user = User.create(email: "test1@test.com", password: "test1234")
   @product.comments.create!(rating: 1, user: @user, body: "Awlful bike!")
   @product.comments.create!(rating: 3, user: @user, body: "This is a great bike!")
   @product.comments.create!(rating: 5, user: @user, body: "This product is fantastic")
 end
 
 it "returns the average rating of the comments" do
   expect(@product.average_rating).to eq 3
 end
 
 it "shouldn't create a product becasue there is a missing name" do
   expect(Product.new(description: "Great Bike")).to_not be_valid
 end
end