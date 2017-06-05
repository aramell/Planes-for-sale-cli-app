
class PlanesForSale::Plane
    attr_accessor :name, :price, :location, :url, :total_time, :dealer, :planes

    @@all = []

    def self.airplane
    
       
        # return the instances of the planes
        
        new_plane = self.new
        new_plane.name = "this is a plane"
        new_plane.price = " $100"
        new_plane.location = "new york"
        new_plane.url = 'https://www.controller.com/listings/aircraft/for-sale/*' 
        new_plane.total_time = "500 hrs"
        @@all << new_plane
   end

   def initialize(name = nil, url= nil, location = nil, dealer = nil)

        @name = name
        @url = url
        @location = location
        @dealer = dealer

    end

    def self.all
        @@all
    end

    
    def self.create_from_index
    
        PlanesForSale::Scraper.scrape_plane_page.each do |p|
            self.new(p)
            binding.pry
        end
        
    end
end