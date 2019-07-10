require_relative '../config/environment'

#Parser.start_parsing
#while Interface.user_input != 'quit'
Interface.runner
# input = Interface.user_input
# while input != 'quit'
#     case input
#     when '1'
#     Interface.most_recent_photo
#     when '2'
#     Interface.guessing_game
#     when '3'
#     Interface.favorite_photos
#     when '4'
#     Interface.see_favorite_photos
#     when 'quit'
#         break
#     end
# end


# input = ""
# while input
#   puts "Please enter a command:"
#   input = gets.downcase.strip
#   case input
#   when 'list'
#     list(songs)
#   when 'play'
#     list(songs)
#     play(songs)
#   when 'help'
#     help
#   when 'exit'
#     exit_jukebox
#     break
#   else
#     help
#   end
# end