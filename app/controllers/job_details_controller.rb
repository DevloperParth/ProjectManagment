class JobDetailsController < ApplicationController

  #before_action :load_and_authorize_resource
  before_action :authenticate_user!, :except => [:index]
  #load_and_authorize_resource

  def index
    if params[:category].blank?
			@job_details = JobDetail.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@job_details = JobDetail.where(category_id: @category_id).order("created_at DESC")
		end
    #@job_details = JobDetail.all
  end    
  
  def show
    @job_detail = JobDetail.find(params[:id])
  end
  
  def new
   # @employee = Employee.find(params[:employee_id])
    @employer = Employer.find(params[:employer_id])
    @job_detail = JobDetail.new
  end


  def create
    @employer = Employer.find(params[:employer_id])
    #@employee = Employee.find(params[:employee_id])
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
    #authorize @job_detail
    @job_detail = JobDetail.find(params[:id])
    @job_detail.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def job_params
      params.require(:job_detail).permit(:employer_id, :Job_title, :Job_summary,
      :Qualification_skills, :Experience, :salary, :category_id)
    end


end

