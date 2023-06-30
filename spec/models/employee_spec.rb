require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of (:address) }
    it { should validate_presence_of(:city) } 
    it { should validate_presence_of(:contact_num) }
  end
end

 
# validates_presence_of :name, :city, :address :contact_num, :state, :attachment
#   validates :email, presence: true, uniqueness: true