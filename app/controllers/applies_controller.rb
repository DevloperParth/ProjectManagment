class AppliesController < ApplicationController

  def new
    #@employer = Employer.find(params[:employer_id])
    @employee = JobDetail.new
  end
  # def create
  #   @employer = Employer.find(params[:employer_id])
  #   #@employee = Employee.find(params[:employee_id])
  #   @job_detail = @employer.job_details.new(job_params)
  #   if @job_detail.save!
  #     redirect_to @job_detail
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # private
  #   def applies_params
  #     params.require(:job_detail).permit(:employee_id, :Job_title, :Job_summary,
  #     :Qualification_skills, :Experience, :salary)
  #   end

end
