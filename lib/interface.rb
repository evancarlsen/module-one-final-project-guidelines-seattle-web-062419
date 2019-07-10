class Interface
    def self.get_api_key
        puts "Please paste your API key:"
        output = gets.chomp
        output
    end
end