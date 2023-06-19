class JobDetail < ApplicationRecord
  belongs_to :employer
  belongs_to :category
  has_many :applicants
  has_many :employees
end
