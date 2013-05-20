class RemoveHostIdFromCheckpoint < ActiveRecord::Migration
  def up
  remove_column :checkpoints, :host_id
  end

  def down
  end
end
