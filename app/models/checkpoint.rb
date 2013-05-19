class Checkpoint < ActiveRecord::Base
  attr_accessible :host_id, :location, :name, :points, :route, :task
end
