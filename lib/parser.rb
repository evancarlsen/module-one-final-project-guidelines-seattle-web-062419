require_relative '../config/environment'
require 'JSON'
class Parser
    
    def self.start_parsing
        puts get_hash

    end

    def self.get_hash
        key = Interface.get_api_key
        rover_url = "https://api.nasa.gov/mars-photos/api/v1/rovers?api_key="
        rover_url << key
        rovers = RestClient.get(rover_url)
        rover_array = JSON.parse(rovers)["rovers"]
    end
end