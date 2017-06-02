class PlanesForSale::CLI



    def call

        puts "today's planes"
        list_planes
        menu
        goodbye
    end

    def list_planes

        puts "Here are the planes:"
        # @planes.each.with_index(1) do |plane, i|
        # puts "#{i}. #{plane}"
        # end
    end


    def menu
        input = nil
         while input != "exit"
          puts "Enter the number for the plane you would like more info on or type list to see planes or type exit:"
             input = gets.strip.downcase
             if input.to_i? > 0
                 puts @deals[input.to_i-1]
                case input
                    when "1"
                        puts "more info on plane 1..."
                    when "2"
                        puts "more info on plane 2..."
                    when "list"
                        list_planes
                    when "exit"
                        goodbye
                 end
            end
        end
    end

    def goodbye

        puts "goodbye!"

    end

end