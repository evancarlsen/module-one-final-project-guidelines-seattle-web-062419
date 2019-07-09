class CreateRovers < ActiveRecord::Migration[4.2]
    def change
      create_table :Rovers do |t|
        t.string :name
      end
    end
  end