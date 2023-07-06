require 'rails_helper'
require_relative "../support/devise"


RSpec.describe "Employees", type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:employer) { create(:employer) } # Assuming you have an employer factory set up
  let(:category) { create(:category) } # Assuming you have a category factory set up
  let(:job_detail) { create(:job_detail, employer: employer, category: category) } # Assuming you have a job_detail factory set up
  let(:employee) { create(:employee, user: user, job_detail: job_detail) }

  describe "GET #index" do
    it "assigns all employees to @employees" do
      employee1 = create(:employee, user: user, job_detail: job_detail)
      employee2 = create(:employee, user: user, job_detail: job_detail)
      get :index
      expect(assigns(:employees)).to match_array([employee1, employee2])
    end
  end  
end
