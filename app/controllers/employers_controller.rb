class EmployersController < ApplicationController
  
  def index 
    @employer = current_user.employer
  end
  
  def show
    @employer = Employer.find(params[:id])
  end
  
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.create(employers_params)
    @employer[:user_id]=current_user.id
    if @employer.save
      redirect_to @employer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employer = Employer.find(params[:id])
  end

  def update
    @employer = Employer.find(params[:id])

    if @employer.update(employers_params)
      redirect_to @employer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employer = Employer.find(params[:id])
    @employer.destroy

    redirect_to  root_path, status: :see_other
  end

  private
    def employers_params
      params.require(:employer).permit(:name)
    end

end
