class JobDetail < ApplicationRecord
  belongs_to :employer
  belongs_to :category

  has_many :job_applications 
  has_many :employees, through: :job_applications, source: :employee

  def update_application_status(status)
    employees.update(application_status: status)
  end

end
