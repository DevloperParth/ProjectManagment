class EmployeeJobDetail < ApplicationRecord
  belongs_to :employee
  belongs_to :job_detail
  has_many :employees, through: :employee_job_details
  has_many :job_details, through: :employee_job_details
end
