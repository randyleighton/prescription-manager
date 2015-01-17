class AddCostsToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :user_paid, :float
    add_column :prescriptions, :medicare_paid, :float
  end
end
