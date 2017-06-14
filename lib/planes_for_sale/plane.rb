
class PlanesForSale::Plane
    attr_accessor :name, :price, :avionics, :phone, :location, :url, :total_time, :dealer, :planes, :desc, :doc, :airframe

    @@all = []
    
   def initialize(name = nil, dealer = nil, phone = nil, location = nil, price = nil, desc = nil, url = nil)

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

    def self.sort_by_price_desc
        PlanesForSale::Plane.all.sort_by do |p| 
            p.price.split("$").last.gsub(",","").to_i
        end.reverse
        
    end


end