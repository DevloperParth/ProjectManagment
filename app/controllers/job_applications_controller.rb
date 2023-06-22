class JobApplicationsController < ApplicationController
  def create
    @job_detail = JobDetail.find(params[:job_detail_id])
    @employee = Employee.find(params[:employee_id])
    @application = JobApplication.new(job_detail: @job_detail, employee: @employee)
    if @application.save
      redirect_to @employee, notice: 'Job application submitted successfully!'
    else
      redirect_to @employee, alert: 'Failed to submit job application.'
    end
  end 
end
