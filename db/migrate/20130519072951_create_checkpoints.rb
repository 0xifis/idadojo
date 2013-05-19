class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.string :location
      t.string :route
      t.text :task
      t.integer :points
      t.integer :host_id

      t.timestamps
    end
  end
end
