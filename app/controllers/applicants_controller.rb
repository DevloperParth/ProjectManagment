class ApplicantsController < ApplicationController
  
  def new
    @applicant = Applicant.new
  end

  def create
    @employee = Employee.find(params[:employees_id])
    #@job_detail = @employer.job_details.new(job_params)
    if @applicant.save!
      redirect_to @applicant
    else
      render :new, status: :unprocessable_entity
    end
  end
end
