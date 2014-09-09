class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :drug_id
      t.string :drug_uom
      t.integer :renewal_interval
      t.timestamps
    end
  end
end
