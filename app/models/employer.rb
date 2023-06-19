class Employer < ApplicationRecord
  belongs_to :user
  has_many :job_details
end
