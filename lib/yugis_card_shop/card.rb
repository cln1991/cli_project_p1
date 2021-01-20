#class YugisCardShop::Card  
    #attr_accessor :name, :type, :desc, :atk, :def, :level, :race, :attribute

    #@@all = []

    #def self.all
        #@@all
    #end

    #def initialize
        #save
    #end

    #def save
        #@@all << self
    #end

    #def self.result
        #This will return the result of the card search
       #puts "Here's the card:"
        #card_info = self.new
        #card_info.name = "Pot of Greed"
        #card_info.type = "Spell"
        #card_info.desc = "Draw two cards"
        #[card_info]
    #end

    #def self.reset_all
        #@@all.clear
    #end

#end
#-----
class YugisCardShop::Card
    require 'pry'
    attr_accessor :name, :type, :desc, :attack, :defense, :level, :race, :attribute
    
    @@all = []

    def initialize(data)
        #binding.pry
        self.name = data[:name]
        self.type = data[:type]
        self.desc = data[:desc]
        self.attack = data[:attack]
        self.defense = data[:defense]
        self.level = data[:level]
        self.race = data[:race]
        self.attribute = data[:attribute]
        self.save
    end

    def save
        self.class.all.push(self)
    end

    def self.all
        @@all
    end

    def self.create_card_info_from_hash(data)
        
        card_data = {
        :name => data["data"][0]["name"],
        :type => data["data"][0]["type"],
        :desc => data["data"][0]["desc"],
        :attack => data["data"][0]["atk"],
        :defense => data["data"][0]["def"],
        :level => data["data"][0]["level"],
        :race => data["data"][0]["race"],
        :attribute => data["data"][0]["attribute"]
        }
        #binding.pry
        new(card_data).save
    end
end