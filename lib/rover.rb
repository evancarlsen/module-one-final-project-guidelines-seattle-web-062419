class Rover < ActiveRecord::Base
    has_many :rover_cameras
    has_many :cameras, through: :rover_cameras
end