class JobApplication < ApplicationRecord
  belongs_to :job_detail
  belongs_to :employee

end
