class CreatePhotos < ActiveRecord::Migration[4.2]
    def change
      create_table :Photos do |t|
        t.string :url
        t.string :earth_day
      end
    end
  end