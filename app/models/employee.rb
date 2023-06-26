class Employee < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  validates :name, presence: true

  belongs_to :user

  has_many :job_applications
    
end

