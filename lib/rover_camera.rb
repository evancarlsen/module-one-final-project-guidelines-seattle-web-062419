class RoverCamera < ActiveRecord::Base
    belongs_to :rover
    belongs_to :camera
end