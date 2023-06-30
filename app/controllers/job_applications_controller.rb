class JobApplicationsController < ApplicationController
  # before_action :authenticate_user!

  before_action :set_job_detail, only: [:accept, :reject]
  before_action :set_job_application, only: [:accept, :reject]

  def new
    @job_detail = JobDetail.find(params[:job_detail_id])
    @job_application = @job_detail.job_applications.new
  end

  def show
  end

  
  def create
    @job_detail = JobDetail.find(params[:job_detail_id])
    @job_application = @job_detail.job_applications.new(application_params)
    @job_application.employee_id = current_user.employees.first.id

    begin
      if @job_application.save
        redirect_to job_detail_path(@job_detail), notice: 'Application submitted successfully.'
      else
        render :new
      end
    rescue ActiveRecord::RecordNotUnique => e
      # Handle the duplicate job application error here
      redirect_to job_detail_path(@job_detail), alert: 'You have already applied for this job.'
    end
  end

  def accept
    @job_application.update(status: 'accepted')
    employer = @job_application.job_detail.employer
    JobApplicationMailer.application_accepted(@job_application.employee,@job_application,employer ).deliver_now
    redirect_to job_detail_path(@job_detail), notice: 'Application accepted successfully.'
  end

  def reject
    @job_application.update(status: 'rejected')
    employer = @job_application.job_detail.employer
    JobApplicationMailer.application_rejected(@job_application.employee,@job_application,employer).deliver_now
    redirect_to job_detail_path(@job_detail), notice: 'Application rejected successfully.'
  end

  

  private

  def application_params
    params.require(:job_application).permit(:name,:job_detail_id,:employee_id)
  end

  def set_job_detail
    @job_detail = JobDetail.find(params[:job_detail_id])
  end

  def set_job_application
    @job_application = @job_detail.job_applications.find(params[:id])
  end
end
