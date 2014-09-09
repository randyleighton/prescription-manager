class CreateLedger < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.integer :donut_hole_total
      t.integer :ytd_paid_total
      t.timestamps
    end
  end
end
