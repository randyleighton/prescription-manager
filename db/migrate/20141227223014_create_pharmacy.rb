class CreatePharmacy < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :phone
      t.string :street
      t.string :state
      t.string :zip
      t.text :url
      t.integer :user_id
    end
  end
end
