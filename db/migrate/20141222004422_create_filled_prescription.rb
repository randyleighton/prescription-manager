class CreateFilledPrescription < ActiveRecord::Migration
  def change
    create_table :filled_prescriptions do |t|
      t.integer :prescription_id
      t.integer :drug_id
      t.integer :quantity

      t.timestamps
    end
  end
end
