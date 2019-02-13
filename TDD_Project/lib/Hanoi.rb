class InvalidInput < StandardError; end
class InvalidMove < StandardError; end

class Hanoi
    attr_reader :lg_disc, :md_disc, :sm_disc
    attr_accessor :piles, :count
    def initialize
        @count = 0
        @lg_disc = 3
        @md_disc = 2
        @sm_disc = 1
        @piles = [[lg_disc,md_disc,sm_disc],[],[]]
    end
    
    def valid_input?(input)
        raise InvalidInput unless (0..2).to_a.include?(input)
        return true 
    end

    def valid_move(disk_1, disk_2)
        raise InvalidMove if disk_1 > disk_2
        return true
    end
    def move ()
        begin
            puts "Please pick a pole # to choose from."
            usr_in_1 = gets.chomp.to_i    
            valid_input?(usr_in_1)
            raise InvalidInput if self.piles[usr_in_1].empty?
        rescue InvalidInput
            puts "Invalid input, please try again."
            retry
        end

        begin
            puts "Please pick a pole # to move disc to."
            usr_in_2 = gets.chomp.to_i
            valid_input?(usr_in_2)
            disk_1 = self.piles[usr_in_1].last
            disk_2 = self.piles[usr_in_2].last
            raise InvalidInput if usr_in_1 == usr_in_2
            valid_move(disk_1,disk_2)
        rescue InvalidInput
            puts "Invalid input, please try again."
            retry
        rescue InvalidMove
            puts "Can't move disk there, please pick another pole #"
            retry
        end

        moving = self.piles[usr_in_1].pop
        self.piles[usr_in_2] << moving
        p self.piles

        self.count += 1
    end
end