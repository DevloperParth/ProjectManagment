class JobDetail < ApplicationRecord
  belongs_to :employer
  belongs_to :category
  has_many :applicants

  has_many :employee_job_details, class_name: 'EmployeeJobDetail'
  has_many :employees, through: :employee_job_details, source: :employee

  def update_application_status(status)
    employees.update(application_status: status)
  end

  def applicant_count
    employees.count
  end
end
