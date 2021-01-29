module YugisCardShop

    class CLI
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
                    show_card
                else 
                    puts "Sorry, was that a yes or no or show?"
                end
            end
        end     

        def show_card
            puts "Alright, what are you looking for, Normal Monster, Spell Card, Trap Card or all?"
            @inputs = nil
            @inputs = gets.chomp
            case @inputs
            when "all"
                puts "Here are the cards you have asked for:"
                puts "------------"
                Card.card_array
                another_card
            when "Effect Monster"
                puts "Here are the Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Flip Effect Monster"
                puts "Here are the Flip Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Flip Tuner Effect Monster"
                puts "Here are the Flip Tuner Effect Monster you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Gemini Monster"
                puts "Here are the Gemini Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Normal Monster"
                puts "Here are the Normal Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Normal Tuner Monster"
                puts "Here are the Normal Tuner Monster you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Pendulum Effect Monster"
                puts "Here are the Pendulum Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Pendulum Flip Effect Monster"
                puts "Here are the Pendulum Flip Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Pendulum Normal Monster"
                puts "Here are the Pendulum Normal Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Pendulum Tuner Effect Monster"
                puts "Here are the Pendulum Tuner Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Ritual Effect Monster"
                puts "Here are the Ritual Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Ritual Monster"
                puts "Here are the Ritual Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Spell Card"
                puts "Here are the Spell Cards you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Spirit Monster"
                puts "Here are the Spirit Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Toon Monster"
                puts "Here are the Toon Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Trap Card"
                puts "Here are the Trap Cards you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Tuner Monster"
                puts "Here are the Tuner Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Union Effect Monster"
                puts "Here are the Union Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Fusion Monster"
                puts "Here are the Fusion Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Link Monster"
                puts "Here are the Link Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Pendulum Effect Fusion Monster"
                puts "Here are the Pendulum Effect Fusion Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Synchro Monster"
                puts "Here are the Synchro Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Synchro Pendulum Effect Monster"
                puts "Here are the Synchro Pendulum Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "Synchro Tuner Monster"
                puts "Here are the Synchro Tuner Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "XYZ Monster"
                puts "Here are the XYZ Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            when "XYZ Pendulum Effect Monster"
                puts "Here are the XYZ Pendulum Effect Monsters you have asked for:"
                puts "------------"
                Card.card_select(@inputs)
                another_card
            else
                puts "I didn't quite catch that, did you specify the monster type? Or were you asking for Trap Card, Spell Card or all?"
            end
        end
            
        def goodbye
            puts "Very well, thank you for coming! Hope to see you soon!"
            exit
        end
    end
end