class Employee < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  validates :name, presence: true 
  has_many :applicants
  belongs_to :job_detail
  has_many :job_details, :through => :applicants
end
