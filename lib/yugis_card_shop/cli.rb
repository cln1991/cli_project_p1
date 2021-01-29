#This is my CLI controller
module YugisCardShop

    class CLI #<- start here
        attr_accessor :card_name
        @@i = 0
    
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
            @card = Card.create_card_info_from_hash(card_name)
            display_info(@card)
        end

        def display_info(card)
            puts "----------"
            puts "Name: #{card[@@i].name}"
            puts "Type: #{card[@@i].type}"
            puts "Desc: #{card[@@i].desc}"
            puts "Atk: #{card[@@i].attack}" if card[@@i].attack
            puts "Def: #{card[@@i].defense}" if card[@@i].defense
            puts "Level: #{card[@@i].level}" if card[@@i].level
            puts "Race: #{card[@@i].race}" if card[@@i].race
            puts "Attribute: #{card[@@i].attribute}" if card[@@i].attribute
            puts "----------"
            another_card
        end

        def another_card
            puts "Are you looking for another card or do you want me to show you what you have looked at again?"
            input = nil
            while input != "exit"
                input = gets.strip.downcase
                case input
                when "yes"
                    @@i = @@i + 2
                    enter_card_name
                when "no"
                    goodbye
                when "show"
                    puts "Here are the cards you have asked for:"
                    Card.card_array
                    another_card
                else 
                    puts "Sorry, was that a yes or no or show?"
                end
            end
        end     
            
        def goodbye
            puts "Very well, thank you for coming! Hope to see you soon!"
            exit
        end
    end
end