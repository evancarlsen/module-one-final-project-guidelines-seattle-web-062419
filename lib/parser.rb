require_relative '../config/environment'
require 'JSON'
class Parser
    
    def self.start_parsing
        rover_array = get_array
        rover_names = get_rover_names(rover_array)
        puts rover_names

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
end