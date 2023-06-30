require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates the uniqueness of email' do
      FactoryBot.create(:user, email: 'emilie@mcclure.test')

      user = FactoryBot.build(:user, email: 'emilie@mcclure.test')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end
  end
end
