class CreateCameras < ActiveRecord::Migration[4.2]
    def change
      create_table :cameras do |t|
        t.string :name
      end
    end
  end