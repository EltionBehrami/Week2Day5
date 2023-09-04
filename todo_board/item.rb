require "byebug"
class Item
    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_string)
        # debugger
        nums = "1234567890"
        parts = date_string.split("-")
        return false if parts.length != 3

        year = parts[0]
        month = parts[1]
        day = parts[2]

        return false if year.length != 4
        return false if month.length != 2
        return false if day.length != 2

        year.each_char do |char| 
            if nums.include?(char) == false 
                return false 
            end 
        end 

        month.each_char do|char|
            if nums.include?(char) == false
                return false 
            end 
        end 

        day.each_char do |char| 
            if nums.include?(char) == false 
                return false 
            end 
        end 
        true 
    end 

    def initialize(title, deadline, description)
        @title = title

        if Item.valid_date?(deadline) == false 
            raise ArgumentError {"invalid date format"}
            return false
        else 
            @deadline = deadline
        end 

        @description = description

    end 

    def deadline=(new_deadline)
        # debugger
        if Item.valid_date?(new_deadline) == false 
            return @deadline
        else 
            @deadline = new_deadline
        end 
    end 
    

end 