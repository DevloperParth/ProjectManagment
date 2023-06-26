class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    @job_details = JobDetail.all
  end

  def show
    @employee = Employee.find(params[:id])
    #@job_detail = JobDetail.find(params[:job_id])
  end
  
  def new
    @job_detail_id = params[:job_detail_id]
    @employee = Employee.new
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end

 
  def create
    @employee = current_user.employees.build(employee_params)

    if @employee.save
      redirect_to new_job_detail_job_application_url(job_detail_id:params[:employee][:job_detail_id]), notice: 'Employee profile created successfully.'

    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to  root_path, status: :see_other
  end

  private
    
  def employee_params
    params.require(:employee).permit(:name, :address, :city, :email, :contact_num, :skills,
    :experience, :attachment, :job_detail_id)
  end
end
