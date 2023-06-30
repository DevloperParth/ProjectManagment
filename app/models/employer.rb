class Employer < ApplicationRecord
  belongs_to :user
  has_many :job_details

  validates_presence_of :name, :city, :country, :contact, :state, :address
  validates :email, presence: true, uniqueness: true

end
