class AddEmployeetojobdetail < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_details, :employee, index: true
  end
end
