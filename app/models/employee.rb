class Employee < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  validates :name, presence: true 
  has_many :applicants
  belongs_to :job_detail
  has_many :job_details, :through => :applicants


  def generate_otp
    self.otp = SecureRandom.hex(3) # Generate a 3-digit OTP
    self.save
  end

  def send_otp_email
    JobDetailMailer.otp_email(self).deliver_now
  end
end
