class YugisCardShop::Card
    attr_accessor :name, :type, :desc, :attack, :defense, :level, :race, :attribute
    
    @@all = []

    def initialize(data)
        @name = data[:name]
        self.type = data[:type]
        self.desc = data[:desc]
        self.attack = data[:attack]
        self.defense = data[:defense]
        self.level = data[:level]
        self.race = data[:race]
        self.attribute = data[:attribute]
        @@all << self
    end

    def save    
        self.class.all.push(self)
    end

    def self.all
        @@all
    end

    def self.create_card_info_from_hash(card_name)
        y_api = YugiApi.new(card_name)
        response_hash = y_api.get_response
        @card_data = {
        :name => response_hash["data"][0]["name"],
        :type => response_hash["data"][0]["type"],
        :desc => response_hash["data"][0]["desc"],
        :attack => response_hash["data"][0]["atk"],
        :defense => response_hash["data"][0]["def"],
        :level => response_hash["data"][0]["level"],
        :race => response_hash["data"][0]["race"],
        :attribute => response_hash["data"][0]["attribute"]
        }
        new(@card_data).save
    end

    def self.card_array
        x = @@all.sort_by {|card| card.name}
        x.each do |card|
            puts "Name: #{card.name}"
            puts "Type: #{card.type}"
            puts "Desc: #{card.desc}"
            puts "Attack: #{card.attack}" if card.attack
            puts "Defense: #{card.defense}" if card.defense
            puts "Level: #{card.level}" if card.level
            puts "Race: #{card.race}" if card.race
            puts "Attribute: #{card.attribute}" if card.attribute
            puts "------------"
        end
    end

    def self.card_select(inputs)
        @result = @@all.select {|card| inputs == card.type}
        @result.each do |card|
            puts "Name: #{card.name}"
            puts "Type: #{card.type}"
            puts "Desc: #{card.desc}"
            puts "Attack: #{card.attack}" if card.attack
            puts "Defense: #{card.defense}" if card.defense
            puts "Level: #{card.level}" if card.level
            puts "Race: #{card.race}" if card.race
            puts "Attribute: #{card.attribute}" if card.attribute
            puts "------------"
        end
    end
end