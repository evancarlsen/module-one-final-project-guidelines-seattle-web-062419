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

    def self.get_spirit_photo
        rover_url=
        "https://api.nasa.gov/mars-photos/api/v1/manifests/spirit?api_key=" + @@key
        rover_data = RestClient.get(rover_url)
        rover_hash = JSON.parse(rover_data)
        all_sols = rover_hash["photo_manifest"]["photos"]
        sol_hash = all_sols.sample
        sol_number = sol_hash["sol"]
        camera_name = sol_hash["cameras"].sample
        
        photo_list_url = "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=" + sol_number.to_s + "&api_key=" + @@key
        photo_data = RestClient.get(photo_list_url)
        photo_list = JSON.parse(photo_data)
        photo_url =  photo_list["photos"].sample["img_src"]
        system "open #{photo_url}"
    end

    def self.random_rover_api
        get_spirit_photo
        #@@rover_names.sample
        # rover_name = "spirit"
        # rover_url = "https://api.nasa.gov/mars-photos/api/v1/manifests/" + rover_name
        # rover_url << "?api_key=" + @@key
        # rover_data = RestClient.get(rover_url)
        # rover_hash = JSON.parse(rover_data)
        # all_photos = rover_hash["photo_manifest"]["photos"]
        # puts all_photos
        # date = nil
        # while date == nil
        #     puts rover_name
        #     date = (all_photos.sample)["earth_date"]
        # end
        
        # possible_cameras = @@camera_rover_hash[rover_name]
        # camera = possible_cameras.sample
        # url = "https://api.nasa.gov/mars-photos/api/v1/rovers/" + rover_name
        # url << "/photos?earth_date=" + date
        # url << "&camera=" + camera.downcase
        # url << "&api_key=" + @@key
        # photo_data = RestClient.get(url)
        # photo_hash = JSON.parse(photo_data)
        
        # # explicitly define a default photo URL, then use it as the one we'll show
        # default_photo_url = "https://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/02462/opgs/edr/fcam/FLB_616051613EDR_F0761714FHAZ00337M_.JPG"
        # photo_url = default_photo_url
        # if photo_hash["photos"].length > 1
        #     # if another photo is available then use that photo
        #     photo_url = photo_hash["photos"][0]["img_src"]
        # end
        # system "open #{photo_url}"
    end


    # def self.find_random_photo
        
    # end

    # def self.get_photo_by_earth_date
    #     url = "https://api.nasa.gov/mars-photos/api/v1/rovers/" + Interface.rover_name.downcase
    #     url << "/photos?earth_date=" + Interface.earth_date 
    #     url << "&api_key=" + @@key
    #     photo_data = RestClient.get(url)
    #     photo_hash = JSON.parse(photo_data)
    #     photo_url = photo_hash["photos"][0]["img_src"]
    #     system "open #{photo_url}"
        
    #     Populate.populate_photos(photo_hash)
    # end
end