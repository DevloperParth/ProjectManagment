require 'rails_helper'

RSpec.describe EmployersController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  let(:employer) { FactoryBot.create(:employer, user: user) }

  before do
    sign_in user
  end


  describe "GET #index" do
    it "assigns the employers of current user to @employers" do
      #sign_in user
      get :index
      expect(assigns(:employers)).to eq(user.employers)
    end
  end
end
