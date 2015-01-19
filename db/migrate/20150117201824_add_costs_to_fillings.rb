class AddCostsToFillings < ActiveRecord::Migration

  def change
    add_column :fillings, :medicare_paid, :float
  end

end
