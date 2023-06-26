class JobDetail < ApplicationRecord
  belongs_to :employer
  belongs_to :category

  has_many :job_applications

  def applied_employee_count
    job_applications.count
  end

end
