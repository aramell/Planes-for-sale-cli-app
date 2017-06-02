 require 'open-uri'
 require 'nokogiri'
require 'pry'

class Scraper

      Planesforsale_url = 'https://www.controller.com/listings/aircraft/for-sale/list/category/13/aircraft/manufacturer/cessna/model-group/182'
      plane_url = "https://www.controller.com/listings/aircraft/for-sale/*"


      def self.scrape_plane_page
         plane_list = Nokogiri::HTML(open("https://www.controller.com/listings/aircraft/for-sale/list/category/13/aircraft/manufacturer/cessna/model-group/182"))
            binding.pry
      end
    def self.scrape_profile_page(plane_url)
          
          html = open(profile_url)
          profile_pages = Nokogiri::HTML(html)

    end

end