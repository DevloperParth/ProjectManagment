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
      :Qualification_skills, :Experience, :salary)
    end


end

