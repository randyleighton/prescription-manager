class CreatePharmacy < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :phone
      t.text :url
      t.belongs_to :fillings, index: true
    end
  end
end
