 require 'open-uri'
 require 'nokogiri'
require 'pry'

class PlanesForSale::Scraper

      attr_accessor :plane_title, :plane_desc, :dealer_info, :dealer_phone

      Planesforsale_url = 'https://www.controller.com/listings/aircraft/for-sale/list/category/13/aircraft/manufacturer/cessna/model-group/182'
      plane_url = "https://www.controller.com/listings/aircraft/for-sale/*"
      
      @planes = []


      def self.get_page
            Nokogiri::HTML(open("https://www.controller.com/listings/aircraft/for-sale/list/category/13/aircraft/manufacturer/cessna/model-group/182"))

      end
      
      def self.scrape_plane_index
            self.get_page.css(".border-bottom")

      end


      def self.scrape_plane_page
         doc = Nokogiri::HTML(open(Planesforsale_url))
            doc.search('.listing-name')
      
            doc.css('.listings-list').each do |plane|
                  plane.css('.border-bottom').each do |airplane|
                        plane_listing = self.new
                        plane_listing.plane_title = airplane.css('.listing-name').text
                       plane_listing.plane_desc = airplane.css('.equip-details .m-bottom-5').text
                        plane_listing.dealer_info = airplane.css('.dealer-info .bold').text
                        plane_listing.dealer_phone = airplane.css('.call-it-listing a').text
                        @planes << plane_listing
                        # total_time = airplane.css()
                        # avionics = airplane.css('page.text.match('total')')          
         
                      
                  end
            end
            @planes
      end

      # def create_planes
      #       scrape_plane_index.each do |plane|
      #             create_from_index(plane)

      #       end

      # end

      def self.plane_listings


      end


      # def self.dealer_scrape
      #       scrape_plane_page.airplane.css('.dealer-info .bold').text
      #       binding.pry

      # end
    def self.scrape_profile_page(plane_url)
          
          html = open(profile_url)
          profile_pages = Nokogiri::HTML(html)

    end

end