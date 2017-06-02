class Plane
    attr_accessor :name, :price, :location, :url

    def self.airplane
        plane_1 = Plane.new
        plane_1.name = "this is a plane"
        plane_1.price = " $100"
        plane_1.location = "new york"
        plane_1.url = 'https://www.controller.com/listings/aircraft/for-sale/*'



    end


end