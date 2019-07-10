require_relative '../config/environment'
require 'JSON'
class Parser
    @@rover_names =[]
    @@camera_names =[]
    @@camera_rover_hash={}
    @@key = ""
    def self.camera_names
        @@camera_names
    end
    def self.rover_names
        @@rover_names
    end
    def self.camera_rover_hash
        @@camera_rover_hash
    end

    def self.start_parsing
        rover_array = get_array
        @@rover_names = get_rover_names(rover_array)
        @@camera_names = get_camera_names(rover_array)
        @@camera_rover_hash = get_camera_rover_hash(rover_array)
    end

    def self.get_array
        @@key = ENV["API_KEY"]
        rover_url = "https://api.nasa.gov/mars-photos/api/v1/rovers?api_key="
        rover_url << @@key
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

    def self.get_camera_rover_hash(rover_array)
        new_hash = {}
        rover_array.each do |rover|
            new_hash[rover["name"]] = cameras_from_rover(rover)

        end
        new_hash
    end


    def self.random_rover_api
        rover_name = @@rover_names.sample
        rover_url = "https://api.nasa.gov/mars-photos/api/v1/manifests/" + rover_name
        rover_url << "?api_key=" + @@key
        rover_data = RestClient.get(rover_url)
        rover_hash = JSON.parse(rover_data)
        all_photos = rover_hash["photo_manifest"]["photos"]
        date = (all_photos.sample)["earth_date"]
        puts
        puts
        puts
        puts date
    end


    # def self.find_random_photo
        
    # end
end