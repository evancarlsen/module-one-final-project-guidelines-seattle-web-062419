require_relative '../config/environment'
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
        Parser.camera_rover_hash.each do |rover, camera_array|
            new_rover_id = (Rover.find_by name: rover).id
            camera_array.each do |camera|
                new_camera_id = (Camera.find_by name: camera).id
                RoverCamera.create(rover_id: new_rover_id, camera_id: new_camera_id)
            end
        end
    end

    def self.populate_photos
        Parser.get_photo_hash(url, earth_day, rover_camera_id, fav)
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
        #adds a photo to the db


    end

end