class RoverCamera < ActiveRecord::Base
    belongs_to :rover
    belongs_to :camera
    has_many :photos
end