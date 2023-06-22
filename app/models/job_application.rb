class JobApplication < ApplicationRecord
  belongs_to :employee
  belongs_to :job_detail
end
