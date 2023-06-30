require 'rails_helper'

RSpec.describe Employer, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:contact) }
    it { should belong_to(:user) }
  end
end


# describe Employer do
#   it 'returns the employer name' do
#     employer = FactoryBot.create(:employer)
#     expect(employer.name).to eq('Cyber Infrastructure ')
#     # Modify the following expectation based on your implementation
#     expect(employer).to be_valid
#   end
# end