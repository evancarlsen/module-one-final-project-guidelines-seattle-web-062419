class Interface

    def self.user_input
        gets.strip
    end

    def self.runner
        main_menu
        until user_input == 'quit'
            if user_input == '1'
                Interface.most_recent_photo
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
        puts "[1] See the most recent photo from the surface of Mars!"
        puts "[2] Guess the rover and camera type that took the photo"
        puts "[3] See random photos and favorite them"
        puts "[4] See my favorite photos"
        puts "Or type 'quit' to Quit"
    end

    def self.most_recent_photo
        rover_name = "Curiosity" # this will be from db later
        sol = 100 # this will be from db later
        puts "****** This is the latest photo from the surface of Mars! ******"
        puts "*                                                              *"
        puts "         It was taken by #{rover_name} on Sol #{sol}.           "
        puts "*                                                              *"
        puts "*                          Main Menu                           *"
        puts "*                             [5]                              *"
        puts "****************************************************************"
        # will populate most_recent_photo url
        # will open most recent photo in browser
        if user_input == "5"
            runner
        else 
            invalid_input
            most_recent_photo
        end
    end

    def self.guessing_game
        puts "************************ Guessing Game *************************"
        puts "*                                                              *"
        puts "*                  Which Rover took this?                      *"
        puts "*                                                              *"
        puts "*          [Curiousity] [Opportunity] [Spirit]                 *" 
        puts "*                1             2          3                    *"
        puts "****************************************************************"
        Parser.random_rover_api
        input = user_input
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
            #photo.fav = true
        elsif user_input == "2"
            favorite_photos
        elsif user_input == "5"
            runner
        else 
            invalid_input
            favorite_photos
        end
    end

    def self.see_favorite_photos
        puts "************************ Your Favorites ************************"
        puts "*                                                              *"
        puts "*            You have (fav_photos.count) saved photos          *"
        puts "*                                                              *"
        puts "*                          [Main Menu]                         *"
        puts "*                               5                              *"
        puts "****************************************************************"
        # opens all favorite photos
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