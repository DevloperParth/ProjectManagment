require 'rails_helper'
require_relative "../support/devise"


RSpec.describe EmployersController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'GET #index' do
    login_user
    it "should render employers#show template" do
      get :index
      debugger
      # expect(response).to render_template('employers/show')
    end
  end
end 
#   describe 'GET #show' do
#     it "should render employers#show template" do
    
#       user = create(:user)
#       employer =  create(:employer, user: user) 

#       sign_in(user, scope: :user)
#       employer_path(employer.id)

#       # get :show, params: { id: employer.id }
#       # expect(response).to render_template('employers/show')
#     end  
#   end 
# end