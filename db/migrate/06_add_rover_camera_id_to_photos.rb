class AddRoverCameraIdToPhotos < ActiveRecord::Migration
    def change 
        add_column :photos, :rover_camera_id, :integer
    end
end