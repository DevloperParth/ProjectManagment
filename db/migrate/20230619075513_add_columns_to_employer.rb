class AddColumnsToEmployer < ActiveRecord::Migration[7.0]
  def change
    add_column :employers, :address, :string
    add_column :employers, :email, :string
    add_column :employers, :city, :string
    add_column :employers, :state, :string
    add_column :employers, :country, :string
    add_column :employers, :contact, :integer, limit: 8
  end
end
