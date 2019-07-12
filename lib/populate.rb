require_relative '../config/environment'
require 'pry'
class Populate

    def self.start
        destroy_tables
        populate_rovers
        populate_cameras
        populate_rover_cameras
    end

    def self.populate_rovers
        rover_names = Parser.rover_names
        rover_names.each do |rover_name|
            Rover.create(name: rover_name)
        end
    end

    def self.populate_cameras
        camera_names = Parser.camera_names
        camera_names.each do |camera_name|
            Camera.create(name: camera_name)
        end
    end

    def self.populate_rover_cameras
        # Parser.camera_rover_hash.each do |rover, camera_array|
        #     new_rover_id = (Rover.find_by name: rover).id
        #     camera_array.each do |camera|
        #         new_camera_id = (Camera.find_by name: camera).id
        #         RoverCamera.create(rover_id: new_rover_id, camera_id: new_camera_id)
        #     end
        # end
        Parser.camera_names.each do |camera|
            Parser.rover_names.each do |rover|
                
                camera_id = Camera.find_by(name: camera).id
                rover_id = Rover.find_by(name: rover).id
                RoverCamera.create(rover_id: rover_id, camera_id: camera_id)

            end
        end
    end

    def self.populate_photos(photo_hash)
        puts photo_hash
        #binding.pry

        photo_hash["photos"].each do |photo|
            rover_name = photo["rover"]["name"]
            rover = Rover.find(name: rover_name)

            Photo.create(
                url: photo["img_src"],
                earth_day: photo["earth_date"],
                fav: 0,
                rover_camera_id: rover.id
            )
        end
    end

    def self.destroy_tables
        Rover.destroy_all
        Camera.destroy_all
        RoverCamera.destroy_all
    end

    def self.most_recent_photo_url
        #return url
    end

    def self.get_random_photo
        photo_hash = Parser.get_random_photo
        rover_id = Rover.find_by(name: photo_hash["rover"]).id
        camera_id = Camera.find_by(name: photo_hash["camera"]).id
        photo_rover_camera_id = RoverCamera.find_by(rover_id: rover_id, camera_id: camera_id).id
        photo_url = photo_hash["url"]
        Photo.create(rover_camera_id: photo_rover_camera_id, url: photo_url, liked: 0)
        Photo.last
    end

end