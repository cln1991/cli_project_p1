class YugiApi

    def initialize(card_name)
        @query = card_name
    end

    def get_response
        url = "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=#{CGI.escape(@query)}" #<-This is my API
        uri = URI.parse(url)
        
        response = Net::HTTP.get_response(uri)
        response_hash = JSON.parse(response.body)
    end
end