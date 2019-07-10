class CreateRoverCamera < ActiveRecord::Migration[4.2]
    def change
      create_table :rover_cameras do |t|
        t.integer :rover_id
        t.integer :camera_id
      end
    end
  end
  