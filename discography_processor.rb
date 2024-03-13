require_relative 'trello_api'
require 'dotenv'

Dotenv.load

module DiscographyProcessor
    extend TrelloAPI
  
    def self.process_discography_file(file_path)
      begin
        discography = File.open(file_path)
  
        lists = TrelloAPI.get_lists(ENV['BOARD_ID'])
        list_hash = {}
        lists.each do |list|
          list_hash[list["name"]] = list["id"]
        end
  
        discography.each do |album|
          year, name = album.split(" ", 2)
          decade = year[2] + "0s"
          list_id = list_hash[decade]
          url_name = CGI.escape(name)
          TrelloAPI.create_card(url_name, list_id)
        end
      rescue Errno::ENOENT => e
        puts "Failed to open discography file. Error: #{e.message}"
      end
    end
  end