class RemoveLikedColumnFromPhotos < ActiveRecord::Migration[4.2]
    def change 
        remove_column :photos, liked
    end
end