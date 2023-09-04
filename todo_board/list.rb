require_relative "item"


class List 
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end 

    def add_item(title, deadline, description = " ")
        @items << Item.new(title, deadline, description)
        true 
    end 

    def size
        @items.length
    end 

    def valid_index?(index)
        if index < 0 || index > (@items.length - 1 )
            return false 
        end
        true 
    end 

    def swap(index_1, index_2)
        if self.valid_index?(index_1) == false || self.valid_index?(index_2) == false 
            raise ArgumentError("invalid index")
            return false 
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            
        end 
        true 
    end 

    def [](index)
        if self.valid_index?(index) == false || self.valid_index?(index) == false 
            return nil 
        end 
        @items[index]
    end 

    def priority
        @items.first 
    end 

    def print 
        puts "-------------------------------------"
        puts self.label.upcase 
        puts "-------------------------------------"
        puts "Index | Item  |Deadline"
        puts "-------------------------------------"

        @items.each_with_index do |item, i|
            puts "#{i} | #{item.title.ljust(10)} | #{item.deadline}"
        end

        puts "-------------------------------------"

    end 

    def print_full_item(index)
        if  self.valid_index?(index)
            item = @items[index]
            puts "-------------------------------------"
            puts  "#{item.title.ljust(30)}  #{@items[index].deadline}"
            puts  item.description
            puts "-------------------------------------"
        end
    end 

    def print_priority 
        self.print_full_item(0)
    end 

    def up(index, amount = 1)
        if self.valid_index?(index) == false
            return false 
        end 

        

        while index > 0 && amount > 0
            @items[index], @items[index - 1] = @items[index - 1], @items[index]
            index -= 1
            amount -= 1
        end 
        true 
    end 

    def down(index, amount = 1)
        if self.valid_index?(index) == false
            return false 
        end 


        while index < @items.length - 1 && amount > 0
            @items[index], @items[index + 1] = @items[index + 1], @items[index]
            index += 1
            amount -= 1
        end 
        true 
    end 


    def sort_by_date!
        @items.sort_by! { |item| item.deadline}
    end 









end 