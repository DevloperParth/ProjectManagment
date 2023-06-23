class JobDetail < ApplicationRecord
  belongs_to :employer
  belongs_to :category

  has_many :applications ,class_name: 'JobApplication'

  def update_application_status(status)
    employees.update(application_status: status)
  end

end
