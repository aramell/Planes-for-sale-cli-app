class PlanesForSale::CLI

    def call
        puts "Welcome to the Planes For Sale CLI program"
        puts "This program will show single engine planes on Controller.com"
        puts ""
      PlanesForSale::Scraper.scrape_plane_index        
        list_planes
        menu
        goodbye
    end

    def list_planes
        puts "_____________________" 
        PlanesForSale::Plane.all[0..9].each.with_index(1) do |plane, i|
        puts "#{i}. #{plane.name}"
        
        end
    end

    def additional_planes
        PlanesForSale::Plane.all[10..24].each.with_index(11) do |plane, i|
        puts "#{i}. #{plane.name}"

        end

    end       
    
    def menu
        input = nil
         while input != "exit"
          puts "Please choose a number from the selection, type next to see more planes or type exit to leave"
             input = gets.strip.downcase
           
            airplane = PlanesForSale::Plane.airplane_selection(input.to_i)
                if input.to_i >0
                 display_plane(airplane)
                 puts ""
                 puts "Input list to see more planes or exit to leave program"
                     
                elsif input.to_i > 26
                    puts "please choose a number between 1-25"
                    list_planes
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
            puts "#{airplane.desc}"
            puts ""
            puts "Location:" + "#{airplane.location}"
            puts "Seller: #{airplane.dealer}"
            puts "Phone: #{airplane.phone}"
            puts ""

            puts "#{airplane.price}"
        puts ""
           
        puts "________________________"
    end
    
    def goodbye
        puts ""
        puts "Goodbye!"
        puts ""
        puts ""

    end

end