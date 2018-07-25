
require 'rails_helper'


describe CommentsController, type: :controller do
  let(:user){ User.create!(first_name: 'Total', last_name: 'Addict', email: "total@shinyaddict.com", password: '123456', password_confirmation: '123456') }
  let(:product) {Product.create!(name: 'Shine 1', description: 'The first shiny to add to your collection', image_url: 'shiny1.jpg', price: 8.99)}
  let(:comment) {Comment.create!(user_id: user.id, product_id: product.id, body: 'Shine-taculous!', rating: 5)}

  describe 'GET #show:' do
    context 'When user is logged in show comments' do
      before do
        sign_in user
      end
    end
  end

end