class AddCostsToFillings < ActiveRecord::Migration
  def change
    add_column :fillings, :user_paid, :float
    add_column :fillings, :medicare_paid, :float
  end
end
