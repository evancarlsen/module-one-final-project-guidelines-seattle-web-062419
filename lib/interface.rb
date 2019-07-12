require_relative '../config/environment'

class Interface

    def self.user_input
        gets.strip
    end

    def self.runner
        main_menu
        case user_input
        #when '1'
        #    Interface.search_earth_date
        when '2'
            Interface.guessing_game
        when '3'
            Interface.favorite_photos
        when '4'
            Interface.see_favorite_photos
        when 'quit'
            exit
        else
            invalid_input
            runner
        end
    end

    def self.main_menu
        system ('clear')
        puts "****************************************************************"
        puts "*         Welcome to the Mars Rover Photos Explorer!           *"
        puts "*                 Please choose an option:                     *"
        puts "****************************************************************"
        puts " "
        puts "[1] Not working yet (Search by Earth date)"
        #puts "[1] Seach by Earth date"
        puts "[2] Guess the rover and camera type that took the photo"
        puts "[3] See random photos and favorite them"
        puts "[4] See my favorite photos"
        puts "Or type 'quit' to Quit"
    end

    def self.menu_bar
        puts "****************************************************************"
        puts "*                                                              *"
        puts "*                  [Continue?]    [Main Menu]                  *"
        puts "*                      1              5                        *"
        puts "****************************************************************"
    end

    ################################## 1 ######################################
    def self.search_earth_date
        rover_name = ""
        earth_date = ""

        puts "****************************************************************"
        puts "*                         Rover name?                          *"
        puts "*                                                              *"
        puts "*      [Curiosity]       [Opportunity]      [sorry Spirit]     *"
        puts "*           1                  2                  :(           *"
        puts "****************************************************************"
        if user_input == '1'
            rover_name = "curiosity"
        elsif user_input == '2'
            rover_name = "opportunity"
        else
            invalid_input
            search_earth_date
        end

        puts "****************************************************************"
        puts "*                          Earth Date?                         *"
        puts "*                                                              *"
        puts "*                          (yyyy-mm-dd)                        *"
        puts "****************************************************************"
        # if user_input[4] == "-" && user_input[7] == "-"
        #     earth_date = user_input
        # else
        #     puts invalid_input
        #     puts "                  Please use format :"
        #     puts "                     (yyyy-mm-dd)"
        # end
        earth_date = user_input
        photo = Populate.photo_by_date(rover_name, earth_date)
        #photo = Parser.get_photo_by_earth_date(rover_name, earth_date)
        #Populate.add_new_photo(photo)
        system "open #{Photo.last.url}"
        puts "************** Photo from the surface of Mars! *****************"
        puts "*                                                              *"
        puts "                 Taken by #{rover_name} on #{earth_date}!"
        puts "*                                                              *"
        puts "*                          Main Menu                           *"
        puts "*                             [5]                              *"
        puts "****************************************************************"

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
        puts "*          [Curiosity] [Opportunity] [Spirit]                  *" 
        puts "*                                                              *"
        puts "****************************************************************"
        rand_photo = Populate.get_random_photo
        system "open #{Photo.last.url}"
        rover_camera = RoverCamera.find(Photo.last.rover_camera_id)
        rover_name = Rover.find(rover_camera.rover_id).name
        if user_input.downcase == rover_name.downcase
            puts " "
            puts "                 Correct! Ur so smart                       "
            puts " "
        else
            puts " "
            puts "                Incorrect! Ur so dumb                       "
            puts " "
        end

        puts "************************ Guessing Game *************************"
        puts "*                                                              *"
        puts "*                  Which Camera took this?                     *"
        puts "*                                                              *"
        puts "* [FHAZ] [NAVCAM] [MAST] [CHEMCAM] [MAHLI] [MARDI] [RHAZ]      *" 
        puts "*                                                              *"
        puts "* [PANCAM] [MINITES] [ENTRY]                                   *"
        puts "*                                                              *"
        puts "****************************************************************"
        camera_name = Camera.find(rover_camera.camera_id).name
        if user_input.downcase == camera_name.downcase
            puts " "
            puts "                 Correct! Ur so smart                       "
            puts " "
        else
            puts " "
            puts "                Incorrect! Ur so dumb                       "
            puts " "
        end
        menu_bar
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
        puts "*                   1        2          5                      *"
        puts "*                                                              *"
        puts "****************************************************************"
        rand_photo = Populate.get_random_photo
        system "open #{Photo.last.url}"
        if user_input == "1"
            photo = Photo.last
            photo.fav = 1
            photo.save
            puts
            puts " "
            puts "                      Saved to favorites!"
            puts " "
            favorite_photos
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
        puts "          You have #{Photo.where(:fav => 1).count} saved photos "
        puts "*                                                              *"
        puts "*                          [Main Menu]                         *"
        puts "*                               5                              *"
        puts "****************************************************************"
        if Photo.where(:fav => 1).any?
            Photo.where(:fav => 1).each do |photo|
                system "open #{photo.url}"
            end
        else
            puts " "
            puts "************* You have no favorite photos :( ***************"
            puts " "
            puts "                       [Main Menu]                          "
            puts "                            5                               "
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