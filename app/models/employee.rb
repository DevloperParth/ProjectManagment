class Employee < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  validates :name, presence: true

  has_many :job_applications
  has_many :job_details, through: :job_applications, source: :job_detail

  #validate :unique_application_per_job, on: :create

  # def unique_application_per_job
  #   if job_detail.employees.exists?(user_id: user_id)
  #     errors.add(:base, "You have already applied for this job.")
  #   end
  # end

end

