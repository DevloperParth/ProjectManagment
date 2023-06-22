class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    @job_details = JobDetail.all
  end

  def show
    @employee = Employee.find(params[:id])
    @job_detail = JobDetail.find(params[:job_id])
  end

  def new
    @employee = Employee.new
<<<<<<< HEAD
    @job_id = params[:job_id] if params[:job_id].present?
    @job_detail ||= JobDetail.new
=======
 
    #@job_detail = JobDetail.find(params[:job_detail_id])
>>>>>>> 8636fbeb95c9511442a7fcc0aba8705345155c95
  end

  def confirm_application
    @employee = Employee.new(employee_params)

    if @employee.valid?
      @employee.generate_otp # Generate OTP
      @employee.send_otp_email # Send OTP email

      redirect_to job_details_path, notice: 'OTP sent to your email for confirmation'
    else
      render :index
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end

 
  def create
    puts params.inspect
    @employee = Employee.new(employee_params)
<<<<<<< HEAD
    @job_detail = JobDetail.find(params[:employee][:job_id])
    @employee.job_detail = @job_detail
=======
    
>>>>>>> 8636fbeb95c9511442a7fcc0aba8705345155c95
    if @employee.save
      @job_detail.update(employee_id: @employee.id)
      # @job_detail.employee_id = @employee.id
      # @job_detail.save
      redirect_to @employee, notice: 'Job application submitted successfully.'
      #controller: :applicants, action: :index
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
<<<<<<< HEAD
    :experience, :attachment, :job_detail_id, :job_id)
=======
    :experience, :attachment, :job_detail_id,:employee_id)
>>>>>>> 8636fbeb95c9511442a7fcc0aba8705345155c95
  end
end
