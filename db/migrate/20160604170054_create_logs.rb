class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :event
      t.string :drone_mac_address

      t.timestamps null: false
    end
  end
end
