class CreateFillings < ActiveRecord::Migration
  def change
    create_table :fillings do |t|
      t.belongs_to :prescription
      t.float :price_paid
      t.integer :user_id
      t.integer :pharmacy_id
      t.timestamps
    end
  end
end
