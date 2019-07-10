class Camera < ActiveRecord::Base
    has_many :rover_cameras
    has_many :rovers, through: :rover_cameras
end