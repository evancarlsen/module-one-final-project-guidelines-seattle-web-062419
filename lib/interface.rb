require_relative '../config/environment'

class Interface

    @@rover_name = ""
    @@earth_date = ""

    def self.rover_name
        @@rover_name
    end

    def self.earth_date
        @@earth_date
    end

    def self.user_input
        gets.strip
    end

    def self.runner
        main_menu
        until user_input == 'quit'
            if user_input == '1'
                Interface.search_earth_date
            elsif user_input == '2'
                Interface.guessing_game
            elsif user_input == '3'
                Interface.favorite_photos
            elsif user_input == '4'
                Interface.see_favorite_photos
            else
                invalid_input
                runner
            end
        end
    end

    def self.main_menu
        puts "****************************************************************"
        puts "*         Welcome to the Mars Rover Photos Explorer!           *"
        puts "*                 Please choose an option:                     *"
        puts "****************************************************************"
        puts
        puts "[1] Seach by Earth date"
        puts "[2] Guess the rover and camera type that took the photo"
        puts "[3] See random photos and favorite them"
        puts "[4] See my favorite photos"
        puts "Or type 'quit' to Quit"
    end

    ################################## 1 ######################################
    def self.search_earth_date

        puts "****************************************************************"
        puts "*                         Rover name?                          *"
        puts "*                                                              *"
        puts "*      [Curiosity]       [Spirit]        [Opportunity]        *"
        puts "*           1                2                  3              *"
        puts "****************************************************************"
        if user_input == '1'
            @@rover_name = "curiosity"
        elsif user_input == '2'
            @@rover_name = "spirit"
        elsif user_input == '3'
            @@rover_name = "opportunity"
        else
            invalid_input
            search_earth_date
        end

        puts "****************************************************************"
        puts "*                             Date?                            *"
        puts "*                                                              *"
        puts "*                          (yyyy-mm-dd)                        *"
        puts "****************************************************************"
        @@earth_date = user_input

        puts "************** Photo from the surface of Mars! *****************"
        puts "*                                                              *"
        puts "                 Taken by #{@@rover_name} on #{@@earth_date}!"
        puts "*                                                              *"
        puts "*                          Main Menu                           *"
        puts "*                             [5]                              *"
        puts "****************************************************************"
        Parser.get_photo_by_earth_date
        if user_input == "5"
            runner
        else 
            invalid_input
            search_earth_date
        end
    end

 ################################## 2 ######################################

    def self.guessing_game
        puts "************************ Guessing Game *************************"
        puts "*                                                              *"
        puts "*                  Which Rover took this?                      *"
        puts "*                                                              *"
        puts "*          [Curiousity] [Opportunity] [Spirit]                 *" 
        puts "*                1             2          3                    *"
        puts "****************************************************************"
        Parser.random_rover_api
        photo_hash = {"rover" => "Curiosity"}
        input_to_rover_map = {
            "1" => "Curiosity", "2" => "Opportunity", "3" => "Spirit"}
        if input_to_rover_map[:input] == photo_hash[:rover] # photo_hash[:rover] is temp for testing
            puts "Correct! Ur so smart"
        else
            puts "Incorrect! Ur so dumb"
        end
        puts "****************************************************************"
        puts "*                                                              *"
        puts "*                  [Continue?]    [Main Menu]                  *"
        puts "*                      1              5                        *"
        puts "****************************************************************"
        if user_input == "1"
            guessing_game
        elsif user_input == "5"
            runner
        else 
            invalid_input
            guessing_game
        end
    end

 ################################## 3 ######################################

    def self.favorite_photos
        puts "************************* Random Photo *************************"
        puts "*                                                              *"
        puts "*                      Save to Favorites?                      *"
        puts "*                                                              *"
        puts "*                 [Yes]   [Next]   [Main Menu]                 *" 
        puts "*                   1        2           5                     *"
        puts "*                                                              *"
        puts "****************************************************************"
        Parser.random_rover_api
        if user_input == "1"
            Photo.last.fav = 1
        elsif user_input == "2"
            favorite_photos
        elsif user_input == "5"
            runner
        else 
            invalid_input
            favorite_photos
        end
    end

 ################################## 4 ######################################

    def self.see_favorite_photos
        puts "************************ Your Favorites ************************"
        puts "*                                                              *"
        puts "*            You have (fav_photos.count) saved photos          *"
        puts "*                                                              *"
        puts "*                          [Main Menu]                         *"
        puts "*                               5                              *"
        puts "****************************************************************"
        Photo.each do |photo|
            if photo.fav == 1
                system "open #{Photo.url}"
            end
        end

        if user_input == "5"
            runner
        else 
            invalid_input
            see_favorite_photos
        end
    end

    def self.invalid_input
        puts "                                                               "
        puts "                     >> Invalid Input <<                       "
        puts "                                                               "
    end
end