class CreateRovers_Cameras < ActiveRecord::Migration[4.2]
    def change
      create_table :Rovers_Cameras do |t|
        t.integer :rover_id
        t.integer :camera_id
      end
    end
  end