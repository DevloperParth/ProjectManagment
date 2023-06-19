class ChangeDatattypeToEmployee < ActiveRecord::Migration[7.0]
  def change
    change_column(:employees, :application_status, :string)
  end
end
