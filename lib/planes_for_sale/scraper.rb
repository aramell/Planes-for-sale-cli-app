 require 'open-uri'
 require 'nokogiri'
require 'pry'

class PlanesForSale::Scraper

      Planesforsale_url = 'https://www.controller.com/listings/aircraft/for-sale/list/category/13/aircraft/manufacturer/cessna/model-group/182'
      plane_url = "https://www.controller.com/listings/aircraft/for-sale/*"


      def self.scrape_plane_page
         doc = Nokogiri::HTML(open("https://www.controller.com/listings/aircraft/for-sale/list/category/13/aircraft/manufacturer/cessna/model-group/182"))
            doc.search('.listing-name')

            doc.css('.listings-list').each do |plane|
                  plane.css('.border-bottom').each do |airplane|
                        plane_title = airplane.css('.listing-name').text
                        plane_desc = airplane.css('.equip-details .m-bottom-5').text
                        dealer_info = airplane.css('.dealer-info .bold').text
                        dealer_phone = airplane.css('.call-it-listing a').text
                        total_time = airplane.css()
                        avionics = airplane.css('page.text.match('total')')


                        
           
            binding.pry
                      
                  end
            end
      end
    def self.scrape_profile_page(plane_url)
          
          html = open(profile_url)
          profile_pages = Nokogiri::HTML(html)

    end

end