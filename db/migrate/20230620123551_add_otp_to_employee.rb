class AddOtpToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :otp, :string
  end
end
