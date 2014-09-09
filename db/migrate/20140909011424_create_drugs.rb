class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :description
      t.float :cost_not_in_dh
      t.float :cost_in_dh
      t.float :bill_to_dh
      t.timestamps
    end
  end
end
