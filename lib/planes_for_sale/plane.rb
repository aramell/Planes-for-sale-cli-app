
class PlanesForSale::Plane
    attr_accessor :name, :price, :avionics, :phone, :location, :url, :total_time, :dealer, :planes, :desc, :doc

    @@all = []

    def self.new_from_index(airplane)
        self.new(airplane.css('.listing-name').text, 
        airplane.css('.dealer-info .bold').text.strip, 
        airplane.css('.call-it-listing a').text, #phone
        airplane.at('.dealer-info div[2]').text, #location
        airplane.at('.listing-price-first').text.strip.delete("\n"),
        airplane.css('.equip-details .m-bottom-5').text.strip,
        airplane.css('div.listing-name a').first.attr('href'), #URL
        airplane.at('.fluid-mobile //div[2]').text, #number of seats
        airplane.at('.fluid-mobile').text.strip.delete("\n"),
        airplane.at('.fluid-mobile //div[4]').text.strip.delete("\n") #avionics
        )
    end

    def url(airplane)
         plane_page = airplane.css('div.listing-name a').first.attr('href')
         doc = Nokogiri::HTML(open(plane_page))
    end



   def initialize(name = nil, dealer = nil, phone = nil, location = nil, price = nil, desc = nil, url = nil, seats = nil, total_time = nil, avionics =nil)

        @name = name
        @dealer = dealer
        @location = location
        @price = price
        @desc = desc
        @url = url
        @phone = phone
        @avionics = avionics
        @total_time = total_time

        @@all << self
        end

    def self.all
            @@all
    end  

    def self.airplane_selection(number)
        self.all[number-1]
    end

   
    def description
        url.css('.listings-detail-wrapper #listing-bottom-information').text
    end
# description css tag   doc.css('.listings-detail-wrapper #listing-bottom-information').text

#@url.css('.listings-detail-wrapper #listing-bottom-information').text


end