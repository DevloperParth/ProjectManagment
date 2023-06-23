class JobApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @job_detail = JobDetail.find(params[:job_detail_id])
    @job_application = @job_detail.applications.new
  end

  def create
    @job_detail = JobDetail.find(params[:job_detail_id])
    @job_application = @job_detail.applications.new(application_params)
    @job_application.employee_id = employee.id

    if @job_application.save!
      redirect_to @job_application, notice: 'Application submitted successfully.'
    else
      render :new
    end
  end

  private

  def application_params
    params.require(:job_application).permit(:name)
  end
end
