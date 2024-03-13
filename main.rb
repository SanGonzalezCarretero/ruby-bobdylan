require_relative 'trello_api'
require_relative 'discography_processor'

begin
  DiscographyProcessor.process_discography_file("discography.txt")
rescue StandardError => e
  puts "An error occurred. Error: #{e.message}"
end
