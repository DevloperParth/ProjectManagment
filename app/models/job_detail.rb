class JobDetail < ApplicationRecord
  belongs_to :employer
  has_many :employees
  belongs_to :category
end
