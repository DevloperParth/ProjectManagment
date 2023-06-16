class JobDetail < ApplicationRecord
  belongs_to :employer
  has_many :employees
  belongs_to :category
  has_and_belongs_to_many :employees
end
