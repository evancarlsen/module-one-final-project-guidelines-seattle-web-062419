class AddFavColumnToPhotos < ActiveRecord::Migration[4.2]

    def change
        add_column :photos, :fav, :integer
    end
end