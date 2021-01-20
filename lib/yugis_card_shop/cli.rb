#This is my CLI controller
module YugisCardShop

    class CLI #<- start here
        attr_accessor :card_name
    
        def initialize
            puts "Welcome to the card shop!"
            enter_card_name
        end

        def enter_card_name
            puts "What is the card you are looking for called? For example, are you looking for Dark Magician?"
            card_name = gets.chomp
            puts "Thanks, one moment please."
            display_card_info
        end

        def display_card_info
            #binding.pry
            y_api = YugiApi.new(card_name)
            response_hash = y_api.get_response
            card = Card.create_card_info_from_hash(response_hash)
            display_info(card)
            #binding.pry
        end

        def display_info(card)
            #binding.pry
            puts card[0].name
            puts card[0].type
            puts card[0].desc
            puts card[0].attack if card[0].attack
            puts card[0].defense if card[0].defense
            puts card[0].race if card[0].race
            puts card[0].attribute if card[0].attribute
            another_card
        end


        def another_card
            puts "Are you looking for another card?"
            input = nil
            while input != "exit"
                input = gets.strip.downcase
                case input
                when "yes"
                    enter_card_name
                when "no"
                    goodbye
                else 
                    puts "Sorry, was that a yes or a no?"
                end
            end
        end     
            
        def goodbye
            puts "Very well, thank you for coming by! Hope to see you soon!"
            exit
        end
    end
end