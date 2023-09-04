class Passenger

    attr_reader :name
    

    def initialize(name)
        @name = name
        @flight_numbers = []
    end 


    def has_flight?(flightNumber)
        @flight_numbers.include?(flightNumber.upcase)      
    end

    def add_flight(flightNumber)
        if self.has_flight?(flightNumber) == false 
            @flight_numbers << flightNumber.upcase
        end 
    end 

end 