class Room

    def initialize(number)
        @capacity = number
        @occupants = []
    end 

    def capacity
        return @capacity
    end 

    def occupants
        return @occupants
    end 

    def full?
        if @occupants.length < @capacity
            return false 
        else 
            return true 
        end 
    end 

    def available_space
        return @capacity - @occupants.length 
    end

    def add_occupant(string)
        if !full?
            @occupants << string 
            return true 
        else 
            return false 
        end 
    end

  
end