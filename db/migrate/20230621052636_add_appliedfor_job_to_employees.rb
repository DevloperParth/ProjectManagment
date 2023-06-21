class AddAppliedforJobToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :appliedforjob, :boolean, default:false
  end
end
