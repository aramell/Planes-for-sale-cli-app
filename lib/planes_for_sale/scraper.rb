require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative './student.rb'

class Scraper

      Planesforsale_url = 'file:///home/andrew/code/labs/oo-student-scraper-v-000/fixtures/student-site/index.html'
      plane_url = "file:///home/andrew/code/labs/oo-student-scraper-v-000/fixtures/student-site/*"


      def self.scrape_index_page(planesforsale_url)
         
      end


    def self.scrape_profile_page(plane_url)
          
          html = open(profile_url)
          profile_pages = Nokogiri::HTML(html)

    

end