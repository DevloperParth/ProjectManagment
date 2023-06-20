class JobDetail < ApplicationRecord
  belongs_to :employer
  belongs_to :category
  has_many :applicants
  has_many :employees

  def update_application_status(status)
    employees.update(application_status: status)
  end
end
