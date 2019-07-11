class AddColumnToPhotos < ActiveRecord::Migration
    def change
        add_column :photos, :fav, :blob
    end
end 