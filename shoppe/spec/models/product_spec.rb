require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:blank_product) {Product.new()}

  describe 'validations' do
    context 'Should not allow blank fields' do
      it 'for title' do
        blank_product.save
        expect(blank_product.errors[:title]).to include("can't be blank")
      end

      it 'for price' do
        blank_product.save
        expect(blank_product.errors[:price]).to include("can't be blank")
      end
    end
  end
end
