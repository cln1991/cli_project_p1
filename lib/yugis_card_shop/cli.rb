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
            @card_name = gets.chomp
            puts "Thanks, one moment please."
            display_card_info
        end

        def display_card_info
            y_api = YugiApi.new(card_name)
            response_hash = y_api.get_response
            @card = Card.create_card_info_from_hash(response_hash)
            display_info(@card)
        end

        def display_info(card)
            puts "----------"
            puts "Name: #{card[0].name}"
            puts "Type: #{card[0].type}"
            puts "Desc: #{card[0].desc}"
            puts "Atk: #{card[0].attack}" if card[0].attack
            puts "Def: #{card[0].defense}" if card[0].defense
            puts "Level: #{card[0].level}" if card[0].level
            puts "Race: #{card[0].race}" if card[0].race
            puts "Attribute: #{card[0].attribute}" if card[0].attribute
            puts "----------"
            another_card
        end


        def another_card
            puts "Are you looking for another card?"
            input = nil
            while input != "exit"
                input = gets.strip.downcase
                case input
                when "yes"
                    @card.clear
                    enter_card_name
                when "no"
                    goodbye
                else 
                    puts "Sorry, was that a yes or a no?"
                end
            end
        end     
            
        def goodbye
            puts "Very well, thank you for coming! Hope to see you soon!"
            exit
        end
    end
end