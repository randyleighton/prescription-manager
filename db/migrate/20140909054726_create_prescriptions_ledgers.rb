class CreatePrescriptionsLedgers < ActiveRecord::Migration
  def change
    create_table :prescriptions_ledgers do |t|
      t.integer :prescription_id
      t.integer :ledger_id
      t.date :date
      t.integer :quantity
      t.timestamps
    end
  end
end
