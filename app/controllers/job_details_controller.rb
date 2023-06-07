class JobDetailsController < ApplicationController
  def index
    @job_details = JobDetail.all
  end    
  
  def show
    @job_detail = JobDetail.find(params[:id])
  end
  
  def new
    @job_detail = JobDetail.new
  end

  def create
    @job_detail = JobDetail.create(job_params)
    if @job_detail.save
      redirect_to @job_detail
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def job_params
      params.require(:job_detail).permit(:employer_id, :Job_title, :Job_summary,
      :Qualification_skills, :Experience, :salary)
    end

end

