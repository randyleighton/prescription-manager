class CreateFillings < ActiveRecord::Migration
  def change
    create_table :fillings do |t|
      t.belongs_to :prescription
      t.float :price_paid
      t.string :location_filled
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
