class AddUserIdToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :user_id, :string
  end
end
