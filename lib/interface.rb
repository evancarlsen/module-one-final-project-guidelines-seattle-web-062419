class Interface

    def self.user_input
        gets.chomp
    end

    def self.main_menu
        puts
        puts "Welcome to the Mars Rover Explorer!"
        puts "Please choose an option:"
        puts
        puts "1) See the most recent photo from the surface of Mars!"
        puts "2) Guess the rover and camera type that took the photo"
        puts "3) See random photos and favorite them"
        puts "4) See my favorite photos"
        puts "Or type 'quit' to Quit"
        self.user_input
    end

    def self.most_recent_photo

    end

    def self.guessing_game

    end

    def self.favorite_photos

    end

    def self.see_favorite_photos

    end
end