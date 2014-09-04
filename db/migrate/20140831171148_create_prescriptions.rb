class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
    	t.integer :drug_id
    	t.string :drug_uom
    	t.integer :quantity
    	t.date :date
    	t.integer :renewal_interval
    	t.float :cost_not_in_dh
    	t.float :cost_in_dh
    	t.float :bill_to_dh
    	t.timestamps
    end
  end
end
