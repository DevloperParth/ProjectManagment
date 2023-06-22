<<<<<<< HEAD:db/migrate/20230621161045_create_employee_job_detail.rb
class CreateEmployeeJobDetail < ActiveRecord::Migration[7.0]
=======
class CreateJobApplications < ActiveRecord::Migration[7.0]
>>>>>>> 8636fbeb95c9511442a7fcc0aba8705345155c95:db/migrate/20230622105312_create_job_applications.rb
  def change
    create_table :job_applications do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :job_detail, null: false, foreign_key: true
<<<<<<< HEAD:db/migrate/20230621161045_create_employee_job_detail.rb
=======
      t.string :status
>>>>>>> 8636fbeb95c9511442a7fcc0aba8705345155c95:db/migrate/20230622105312_create_job_applications.rb

      t.timestamps
    end
  end
end
