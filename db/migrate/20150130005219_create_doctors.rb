class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :practice_name
      t.string :office_phone
      t.belongs_to :prescription, index: true
    end
    add_foreign_key :doctors, :prescriptions
  end
end
