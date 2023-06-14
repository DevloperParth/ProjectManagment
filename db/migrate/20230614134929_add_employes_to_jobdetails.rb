class AddEmployesToJobdetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :job_detail, index: true
  end
end
