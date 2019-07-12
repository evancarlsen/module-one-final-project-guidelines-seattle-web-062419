class CreatePhotos < ActiveRecord::Migration[4.2]
    def change
      create_table :photos do |t|
        t.string :url
        t.integer :rover_camera_id
        t.integer :liked
      end
    end
  end