
 require 'open-uri'
 require 'nokogiri'
require 'pry'

      class PlanesForSale::Scraper

      planesforsale_url = '/home/andrew/code/labs/planes_for_sale/Controller.com _ Piston Single Aircraft For Sale.html'
       
    def self.scrape_plane_index
            doc = Nokogiri::HTML(open("/home/andrew/code/labs/planes_for_sale/Controller.com _ Piston Single Aircraft For Sale.html"))
            doc.css('.listings-list').each do |plane|
                  plane.css('.border-bottom').each do |airplane|
                      PlanesForSale::Plane.new(airplane.css('.listing-name').text, 
                        airplane.css('.dealer-info .bold').text.strip, 
                        airplane.css('.call-it-listing a').text, #phone
                        airplane.at('.dealer-info div[2]').text, #location
                        airplane.at('.listing-price-first').text.strip.delete("\n"),
                        airplane.css('.equip-details .m-bottom-5').text.strip,
                        airplane.css('div.listing-name a').first.attr('href') #URL
                               )               
              end
             end

      end

end