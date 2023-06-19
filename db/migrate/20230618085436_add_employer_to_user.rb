class AddEmployerToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :employers, :user
  end
end
