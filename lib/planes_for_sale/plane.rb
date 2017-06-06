
class PlanesForSale::Plane
    attr_accessor :name, :price, :location, :url, :total_time, :dealer, :planes, :desc, :doc

    @@all = []

#     def self.airplane
    
       
#         # return the instances of the planes
        
#         new_plane = self.new
#         new_plane.name = "this is a plane"
#         new_plane.price = " $100"
#         new_plane.location = "new york"
#         new_plane.url = 'https://www.controller.com/listings/aircraft/for-sale/*' 
#         new_plane.total_time = "500 hrs"
#         @@all << new_plane
#    end

       

    def self.new_from_index(airplane)
        
        self.new(airplane.css('.listing-name').text, airplane.css('.dealer-info .bold').text.strip, airplane.css('.call-it-listing a').text, airplane.at('.dealer-info div[2]').text, 
        airplane.at('.listing-price-first').text.strip,
        airplane.css('.equip-details .m-bottom-5').text.strip,
        airplane.css('div.listing-name a').first.attr('href'))
        
        
    end

    def self.url(airplane)
         plane_page = airplane.css('div.listing-name a').first.attr('href')
         @doc = Nokogiri::HTML(open(plane_page))
         @doc.css('.listings-detail-wrapper #listing-bottom-information').text
         binding.pry
    end



   def initialize(name = nil, dealer = nil, phone = nil, location = nil, price = nil, desc = nil, url = nil)

        @name = name
        @dealer = dealer
        @phone = phone
        @location = location
        @price = price
        #@desc = desc
        @url = url
        @@all << self
        end

    def self.all
            @@all
    end  

    def self.airplane_selection(number)
        self.all[number-1]
    end

   
    def description
        binding.pry
        @doc.css('.listings-detail-wrapper #listing-bottom-information').text
        binding.pry
    end

#@url.css('.listings-detail-wrapper #listing-bottom-information').text


end