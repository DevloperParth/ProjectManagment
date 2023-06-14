class JobDetail < ApplicationRecord
  belongs_to :employer
  has_many :employees
end
