require 'httparty'
require 'dotenv'

Dotenv.load

module TrelloAPI 
    def self.create_card(name, list_id)
        response = HTTParty.post("https://api.trello.com/1/cards?name=#{name}&idList=#{list_id}&key=#{ENV['TRELLO_API_KEY']}&token=#{ENV['TRELLO_TOKEN']}")

        if response.success?
            puts "Album #{name} card created successfully."
        else
            puts "Failed to create album card. Error: #{response.code}"
        end
    end

    def self.get_lists(board_id)
        HTTParty.get("https://api.trello.com/1/boards/#{board_id}/lists?key=#{ENV['TRELLO_API_KEY']}&token=#{ENV['TRELLO_TOKEN']}")
      end
end


