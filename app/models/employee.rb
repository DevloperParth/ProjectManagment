class Employee < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  belongs_to :user

  has_many :job_applications

  validates_presence_of :name, :city, :address, :contact_num
  validates :email, presence: true, uniqueness: true
end




