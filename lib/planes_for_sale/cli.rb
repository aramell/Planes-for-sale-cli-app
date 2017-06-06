class PlanesForSale::CLI

    attr_accessor :total_time

    def call
        PlanesForSale::Scraper.scrape_plane_index
        puts "today's planes"
        list_planes
        menu
        goodbye
    end

    def list_planes

        puts "Here are the planes:"
            #list the planes showing
        
        
        PlanesForSale::Plane.all.each.with_index(1) do |plane, i|
        puts "#{i}. #{plane.name} - #{plane.total_time}"

        
        end
    end
    


    def menu
        input = nil
         while input != "exit"
          puts "Enter the number for the plane you would like more info on or type list to see planes or type exit:"
             input = gets.strip.downcase
           
            airplane = PlanesForSale::Plane.airplane_selection(input.to_i)
                # if input.to_i >0
                #     input.to_i-1 
                 display_plane(airplane)
                     
                # elsif  input == "list"
                #     list_planes
                # # elsif "exit"
                #         # goodbye
                # elsif
                #      puts "not sure what you mean... type a plane number, list or exit"
                    
                 

            
        end
    end


    def display_plane(airplane)
        
        puts "________________________"
        PlanesForSale::Plane.all
            puts "Aircraft year/type: #{airplane.name}"
            puts ""
            puts "Location:" + "#{airplane.location}"
            puts "Seller: #{airplane.dealer}"
            puts ""
            puts "#{airplane.price}"
        puts ""
        puts "________________________"
    end

    def goodbye

        puts "goodbye!"

    end

end