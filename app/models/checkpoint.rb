class Checkpoint < ActiveRecord::Base
  attr_accessible :host_id, :location, :name, :points, :route, :task
  has_and_belongs_to_many :teams
end
