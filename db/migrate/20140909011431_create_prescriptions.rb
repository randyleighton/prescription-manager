class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :drug_id
      t.string :drug_uom
      t.integer :renewal_interval
      t.integer :quantity_prescribed
      t.integer :user_id

      t.timestamps
    end
  end
end
