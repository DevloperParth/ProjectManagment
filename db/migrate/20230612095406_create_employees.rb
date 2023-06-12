class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.integer :contact_num
      t.text :skills
      t.string :experience
      t.string :attachment
      t.timestamps
    end
  end
end
