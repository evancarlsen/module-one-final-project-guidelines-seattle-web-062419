class RemoveFavColumnFromPhotos < ActiveRecord::Migration[4.2]

    def change
        remove_column :photos, :fav
    end
end