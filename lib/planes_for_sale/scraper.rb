
 require 'open-uri'
 require 'nokogiri'
require 'pry'

      class PlanesForSale::Scraper

      attr_accessor :plane_title, :plane_desc, :dealer_info, :dealer_phone

      planesforsale_url = '/home/andrew/code/labs/planes_for_sale/Controller.com _ Piston Single Aircraft For Sale.html'
       
    def self.scrape_plane_index
            doc = Nokogiri::HTML(open("/home/andrew/code/labs/planes_for_sale/Controller.com _ Piston Single Aircraft For Sale.html"))
            doc.css('.listings-list').each do |plane|
                  plane.css('.border-bottom').each do |airplane|
                  
                  PlanesForSale::Plane.new_from_index(airplane)
              end
             end

      end

end