require_relative "item"
require_relative "list"



class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end 

    def get_command
            print "\nEnter a command: "
            cmd, *args = gets.chomp.split(' ')
        
            case cmd
            when 'mktodo'
                @list.add_item(*args)
            when 'quit'
                return false
            when 'up'
            index = args[0].to_i
            amount = args[1].to_i
            @list.up(index, amount)
            when 'down'
                index = args[0].to_i
                amount = args[1].to_i
                @list.down(index, amount)
            when 'swap'
                index1 = args[0].to_i
                index2 = args[1].to_i
                @list.swap(index1, index2)
            when 'sort'
                @list.sort_by_date!
            when 'priority'
                @list.print_priority
            when 'print'
                if args.empty?
                    @list.print
                else 
                    index = args[0].to_i
                    @list.print_full_item(index)
                end 
            else
                print "Sorry, that command is not recognized."
            end
        
            true
        end

        def run
            puts "Welcome to the Todo Board!"
        
            while get_command

            end
        
            puts "Goodbye! Have a great day!"
        end



end 