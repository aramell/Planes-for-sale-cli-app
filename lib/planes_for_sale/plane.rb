
class PlanesForSale::Plane
    attr_accessor :name, :price, :location, :url, :total_time, :dealer

    @planes = []

    def self.airplane

        # puts "this is the plane"
        # puts "this is the best plane in the world"
        # return the instances of the planes
        plane_1 = self.new
        plane_1.name = "this is a plane"
        plane_1.price = " $100"
        plane_1.location = "new york"
        plane_1.url = 'https://www.controller.com/listings/aircraft/for-sale/*' 
        plane_1.total_time = "500 hrs"
 
        @planes << plane_1
    end

    def planes
        @planes

    end


end