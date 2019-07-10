class CreateCameras < ActiveRecord::Migration[4.2]
    def change
      create_table :Cameras do |t|
        t.string :name
      end
    end
  end