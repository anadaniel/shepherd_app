class AddControlledByIdToDrone < ActiveRecord::Migration
  def change
    add_column :drones, :controlled_by_id, :integer
  end
end
