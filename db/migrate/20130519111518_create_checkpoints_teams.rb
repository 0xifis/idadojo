class CreateCheckpointsTeams < ActiveRecord::Migration
  def change
    create_table :checkpoints_teams, :id => false do |t|
      t.integer :checkpoint_id
      t.integer :team_id
    end
  end
end
