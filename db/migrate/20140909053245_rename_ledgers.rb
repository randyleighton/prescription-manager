class RenameLedgers < ActiveRecord::Migration
  def change
    rename_table :ledgers, :transactions
  end
end
