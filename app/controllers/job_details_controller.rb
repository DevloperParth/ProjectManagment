class JobDetailsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  #load_and_authorize_resource

  def index
    if params[:category].blank? && current_user.role == "employer"
      @job_details = current_user.employer.job_details.order("created_at DESC")
    
    elsif params[:category].blank? && current_user.role == "employe"
      @job_details = JobDetail.all.includes(:employer).order("created_at DESC")

		else
			@category_id = Category.find_by(name: params[:category]).id
			@job_details = JobDetail.where(category_id: @category_id).order("created_at DESC")
		end
  end    
  
  def show
    @job_detail = JobDetail.find(params[:id])
    #@applicant_count = @job_detail.applicant_count
  end

  def apply_for_job
    @employee = current_user.employee
    @job_detail = JobDetail.new(job_params)
    @job_detail.employee = @employee

    if @job_detail.save
      # Successful save, additional processing or redirection
      redirect_to @job_detail, notice: 'Job application submitted successfully.'
    else
      # Failed save, handle the error
      render :new
    end
  end

  
  def accept
    @job_detail = JobDetail.find(params[:id])
  
    if @job_detail.employee.present?
      @employee = @job_detail.employee
      @employee.update_application_status('accepted')
      redirect_to @employee, notice: 'Job application rejected.'
    else
      redirect_to job_detail_path, alert: 'Employe Not Found'
    end    
  end

  def reject
    @job_detail = JobDetail.find(params[:id])
  
    if @job_detail.employee.present?
      @employee = @job_detail.employee
      @employee.update_application_status('rejected')
      redirect_to @employee, notice: 'Job application rejected.'
    else
      redirect_to job_detail_path, alert: 'Employe Not Found'
    end    
  end

  def applicant_count
    @job_detail = JobDetails.find(params[:id])
    @job_detail.employees.count
  end

  
  def new
    @employer = current_user.employer
    @job_detail = JobDetail.new
  end


  def create
    @employer = Employer.find(params[:employer_id])
    @job_detail = @employer.job_details.new(job_params)
  
    if @job_detail.save!
      redirect_to @job_detail

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @job_detail = JobDetail.find(params[:id])
  end

  def update
    @job_detail = JobDetail.find(params[:id])

    if @job_detail.update(job_params)
      redirect_to @job_detail
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job_detail = JobDetail.find(params[:id])
    @job_detail.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def job_params
      params.require(:job_detail).permit(:employer_id, :Job_title, :Job_summary,
      :Qualification_skills, :Experience, :salary, :category_id ,:employee_id)
    end

end
