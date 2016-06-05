class AddDroneIdToLog < ActiveRecord::Migration
  def change
    add_column :logs, :drone_id, :integer
  end
end
