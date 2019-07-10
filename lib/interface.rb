class Interface

    def self.user_input
        gets.strip
    end

    def self.runner
        main_menu
        input = user_input
        while input
            case input
            when '1'
            Interface.most_recent_photo
            when '2'
            Interface.guessing_game
            when '3'
            Interface.favorite_photos
            when '4'
            Interface.see_favorite_photos
            when 'quit'
                break
            end
        end
    end

    def self.menu_bar
        puts "Return to Main Menu? (Y/n)"
        until user_input != 'y'
            main_menu
        end
    end

    def self.main_menu
        puts
        puts "****************************************************************"
        puts "*            Welcome to the Mars Rover Explorer!               *"
        puts "*                 Please choose an option:                     *"
        puts "****************************************************************"
        puts
        puts "1) See the most recent photo from the surface of Mars!"
        puts "2) Guess the rover and camera type that took the photo"
        puts "3) See random photos and favorite them"
        puts "4) See my favorite photos"
        puts "Or type 'quit' to Quit"
        puts
    end

    def self.most_recent_photo
        rover_name = "Curiosity" # this will be from db later
        sol = 100 # this will be from db later
        puts
        puts "This is the latest photo from the surface of Mars!"
        puts "It was taken by #{rover_name} on Sol #{sol}."
        # will populate most_recent_photo url
        # will open most recent photo in browser
        puts "Return to Main Menu? (Y)"
        if user_input == 'y'
            main_menu
        end
    end

    def self.guessing_game
        input = user_input
        photo_hash = {"rover" => "Curiosity"}
        input_to_rover_map = {
            "1" => "Curiosity", "2" => "Opportunity", "3" => "Spirit"}

        # call populate.guessing_game_photo to get id of randomg photo:
        puts "************************ Guessing Game *************************"
        # will open a random inage in the browser
        puts "Which Rover took this?"
        puts
        puts "[Curiousity] [Opportunity] [Spirit]"
        puts "     1             2          3    "
        puts 
        if input_to_rover_map[:input] == photo_hash[:rover] # photo_hash[:rover] is temp for testing
            puts "Correct! Ur so smart"
        else
            puts "Incorrect! Ur so dumb"
        end
        runner
    end

    def self.favorite_photos
        puts "here is a random photo for you to favorite"
        runner
    end

    def self.see_favorite_photos
        puts "you are seeing all your favorite photos"
        runner
    end

end