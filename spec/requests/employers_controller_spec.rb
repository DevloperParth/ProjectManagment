require 'rails_helper'
require_relative '../support/devise'


RSpec.describe EmployersController, type: :controller do
  #include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:employer) { create(:employer, user: user) }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user.confirm
    sign_in user
  end
  
  describe 'GET #index' do
    #login_user

    it 'assign the res' do
      get :index
      expect(assigns(:employer)).to eq(user.employer)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end 


  describe 'GET #show' do
    #login_user

    it 'assigns the requested employer to @employer' do
      get :show, params: { id: employer.id }
      expect(assigns(:employer)).to eq(employer)
    end

    it 'renders the show template' do
      get :show, params: { id: employer.id }
      expect(response).to render_template(:show)
    end
  end 

  describe 'POST #create' do
    #login_user
    context 'with valid parameters' do
      it 'creates a new employer' do
        expect {
          post :create, params: { employer: attributes_for(:employer) }
        }.to change(Employer, :count).by(1)
      end

      it 'enqueues a SendWelcomeEmailJob' do
        expect {
          post :create, params: { employer: attributes_for(:employer) }
        }.to have_enqueued_job(SendWelcomeEmailJob)
      end
    end
  end   
  
  describe 'GET #edit' do
    #login_user
    it 'assigns the requested employer to @employer' do
      get :edit, params: { id: employer.id }
      expect(assigns(:employer)).to eq(employer)
    end

    it 'renders the edit template' do
      get :edit, params: { id: employer.id }
      expect(response).to render_template(:edit)
    end
  end  

  describe 'PATCH #update' do
    #login_user
    context 'with valid parameters' do
      let(:valid_params) { { name: 'Updated Name' } }

      it 'assigns the requested employer to @employer' do
        patch :update, params: { id: employer.id, employer: valid_params }
        expect(assigns(:employer)).to eq(employer)
      end
      it 'updates the attributes of the employer' do
        patch :update, params: { id: employer.id, employer: valid_params }
        employer.reload
        expect(employer.name).to eq('Updated Name')
      end
    end 
  end  

  describe 'DELETE #destroy' do
    #login_user
    it 'assigns the requested employer to @employer' do
      delete :destroy, params: { id: employer.id }
      expect(assigns(:employer)).to eq(employer)
    end

    # it 'destroys the employer' do
    #   expect {
    #     delete :destroy, params: { id: employer.id }
    #   }.to change(Employer, :count).by(-1)
    # end
  end  
end