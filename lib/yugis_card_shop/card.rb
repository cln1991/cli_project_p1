class YugisCardShop::Card
    require 'pry'
    attr_accessor :name, :type, :desc, :attack, :defense, :level, :race, :attribute
    
    @@all = []

    def initialize(data)
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
        @card_data = {
        :name => data["data"][0]["name"],
        :type => data["data"][0]["type"],
        :desc => data["data"][0]["desc"],
        :attack => data["data"][0]["atk"],
        :defense => data["data"][0]["def"],
        :level => data["data"][0]["level"],
        :race => data["data"][0]["race"],
        :attribute => data["data"][0]["attribute"]
        }
        new(@card_data).save
    end

end