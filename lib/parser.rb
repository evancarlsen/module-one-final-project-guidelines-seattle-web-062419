require_relative '../config/environment'
require 'JSON'
class Parser
    
    def self.start_parsing
        rover_array = get_array
        rover_names = get_rover_names(rover_array)
        camera_names = get_camera_names(rover_array)
        puts camera_names

    end

    def self.get_array
        key = Interface.get_api_key
        rover_url = "https://api.nasa.gov/mars-photos/api/v1/rovers?api_key="
        rover_url << key
        rovers = RestClient.get(rover_url)
        rover_array = JSON.parse(rovers)["rovers"]
    end

    def self.get_rover_names(rover_array)
        names = rover_array.map do |rover_hash|
            rover_hash["name"]
        end
    end

    def self.cameras_from_rover(rover_hash)
        cameras = rover_hash["cameras"].map do |camera_hash|
            camera_hash["name"]
        end
    end

    def self.get_camera_names(rover_array)
        camera_names = []
        rover_array.each do |rover_hash|
            camera_names << cameras_from_rover(rover_hash)
        end
        camera_names.flatten.uniq!
    end
end