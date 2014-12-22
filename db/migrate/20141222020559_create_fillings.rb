class CreateFillings < ActiveRecord::Migration
  def change
    create_table :fillings do |t|
      t.belongs_to :prescription

      t.timestamps null: false
    end
  end
end
