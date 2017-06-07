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
        
        
        PlanesForSale::Plane.all[0..9].each.with_index(1) do |plane, i|
        puts "#{i}. #{plane.name} - #{plane.total_time}"
        


        
        end
    end

    def additional_planes
        PlanesForSale::Plane.all[10..19].each.with_index(11) do |plane, i|
        puts "#{i}. #{plane.name} - #{plane.total_time}"

        end

    end       
    


    def menu
        input = nil
         while input != "exit"
          puts "Enter the number for the plane you would like more info on or type list to see planes or type exit:"
             input = gets.strip.downcase
           
            airplane = PlanesForSale::Plane.airplane_selection(input.to_i)
                if input.to_i >0
                 display_plane(airplane)
                 puts ""
                 puts "Enter more if you would like more details on this plane; otherwise input list to see more planes or exit to leave program"
                     
                elsif  input == "list"
                  list_planes
                elsif input == "next"
                    additional_planes
               
               elsif input == "more"
                   more_detail(airplane)

                 else
                     puts ""
                 puts "not sure what you mean... type a plane number, list or exit"
                 puts ""   
                 

            end
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
            puts "#{airplane.phone}"
        puts "________________________"
    end

    def more_detail(airplane)
            puts "Aircraft year/type: #{airplane.name}"
            puts ""
            puts "Location:" + "#{airplane.location}"
            puts "Seller: #{airplane.dealer}"
            puts "Phone: #{airplane.price}"
            puts " "
            
            puts "#{Plane.description}"
            binding.pry.
            puts "#{airplane.url}"


    end
    def goodbye
        puts ""
        puts "goodbye!"
        puts ""
        puts ""

    end

end