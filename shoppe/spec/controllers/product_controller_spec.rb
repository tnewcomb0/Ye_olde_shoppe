require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'product create' do
    context 'when given valid params' do
      let :category do {id: 2, title: 'hveavhb'}
      end
      let :product_params do
        {title: 'trev',
        description: 'a thing',
        price: '345',
        photo_url: 'eaivulhwreiVBE',
        category_id: 2}
       end
       it 'should create the product and redirect to category show page' do
        expect{
          post :create, {category_id: 2, product: product_params}
          }.to change{Product.count}.by(1)
        end
      end
    context 'when given invalid params' do
      let :category do {id: 2, title: 'hveavhb'}
      end
      let :product_params do
        {title: 'trev',
        description: 'a thing',
        photo_url: 'eaivulhwreiVBE',
        category_id: 2}
       end
      it 'should not create the product and throw an error message' do
        expect{
          post :create,{category_id: 2,  product: product_params}
        }.to_not change{Product.count}
      end
    end
  end
end
