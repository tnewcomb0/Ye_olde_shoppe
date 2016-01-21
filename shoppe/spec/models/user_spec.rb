require 'rails_helper'

RSpec.describe User, type: :model do
  let(:blank_user) {User.new()}

  describe 'validations' do
    context 'Should not allow blank fields' do
      it 'for username' do
        blank_user.save
        expect(blank_user.errors[:username]).to include("can't be blank")
      end

      it 'for email' do
        blank_user.save
        expect(blank_user.errors[:email]).to include("can't be blank")
      end

      it 'for password' do
        blank_user.save
        expect(blank_user.errors[:password_digest]).to include("can't be blank")
      end
    end
  end
end
