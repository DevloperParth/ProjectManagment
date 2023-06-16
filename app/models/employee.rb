class Employee < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  validates :name, presence: true 
  has_and_belongs_to_many :job_details
end
