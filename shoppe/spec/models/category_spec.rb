require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:blank_category) {Category.new()}

  describe 'validations' do
    context 'Should not allow blank fields' do
      it 'for title' do
        blank_category.save
        expect(blank_category.errors[:title]).to include("can't be blank")
      end
    end
  end
end
