class PlanesForSale::CLI

    attr_accessor :total_time

    def call

        puts "today's planes"
        list_planes
        menu
        goodbye
    end

    def list_planes

        puts "Here are the planes:"
            #list the planes showing
        @planes = PlanesForSale::Plane.airplane 
        
        @planes.each.with_index(1) do |plane, i|
        puts "#{i}. #{plane.name} - #{plane.total_time}"

        
        end
    end
    


    def menu
        input = nil
         while input != "exit"
          puts "Enter the number for the plane you would like more info on or type list to see planes or type exit:"
             input = gets.strip.downcase
            
                if input.to_i >0
                    puts @planes[input.to_i-1]
                elsif  input == "list"
                    list_planes
                # elsif "exit"
                        # goodbye
                # elsif
                #      puts "not sure what you mean... type a plane number, list or exit"
                    
                 

            end
        end
    end

    def display_planes
        

        PlanesForSale::Plane.each do |plane|
            puts "#{plane.name}"
            puts "#{plane.location}"
            puts "#{plane.dealer}"
            
        end
    end

    def goodbye

        puts "goodbye!"

    end

end