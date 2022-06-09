require_relative "room"

class Hotel

    def initialize(name, hash)
        @name = name 
        @rooms = {} # set room to new hash 
        hash.each {|k,v| @rooms[k] = Room.new(v)}
        # hash.each do |k,v|
        # @rooms[k] = Room.new(v)
        # end 
    end 

    def name 
        return @name.split(" ").map {|ele| ele.capitalize}.join(" ")
    end 
    
    def rooms 
        return @rooms
    end 

    def room_exists?(name)
        @rooms.has_key?(name)
    end 

    def check_in(person, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person)
                print "check in successful"
            else 
                print "sorry, room does not exist"
            end 
        else
         puts "sorry, room is full"
        end 
    end 

    def has_vacancy?    
        @rooms.each do |k,v|
            if v.available_space > 0 
                return true 
            else 
                return false
            end 
        end 
    end 

    def list_rooms
        @rooms.each do |room_name, room|
            puts room_name.to_s + " " + room.available_space.to_s
        end 
    end 
        
end
