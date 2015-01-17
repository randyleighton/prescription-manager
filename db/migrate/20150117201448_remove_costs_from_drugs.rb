class RemoveCostsFromDrugs < ActiveRecord::Migration

  def up
    remove_column :drugs, :cost_not_in_dh
    remove_column :drugs, :cost_in_dh
    remove_column :drugs, :bill_to_dh
  end

  def down
    add_column :drugs, :cost_not_in_dh, :float
    add_column :drugs, :cost_in_dh, :float
    add_column :drugs, :bill_to_dh, :float
  end

end
