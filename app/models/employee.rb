class Employee < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  validates :name, presence: true

<<<<<<< HEAD
  has_many :employee_job_details
  has_many :job_details, through: :employee_job_details, source: :job_detail
   
  attr_accessor :job_id
  
=======
  has_many :job_applications
  has_many :job_details, through: :job_applications, source: :job_detail

>>>>>>> 8636fbeb95c9511442a7fcc0aba8705345155c95
  #validate :unique_application_per_job, on: :create

  # def unique_application_per_job
  #   if job_detail.employees.exists?(user_id: user_id)
  #     errors.add(:base, "You have already applied for this job.")
  #   end
  # end

end

