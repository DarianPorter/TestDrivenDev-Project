class OnlyIntegerError < StandardError; end
class InvalidInput < StandardError; end
class InvalidMove < StandardError; end



class Array 
    def my_uniq ()
        newArr = []
        my_hash = Hash.new(0)
        self.each {|ele| my_hash[ele] += 1}

        my_hash.each {|k,_| newArr << k }
        return newArr
    end

    def two_sum()
        raise OnlyIntegerError unless self.all?{|ele| ele.is_a?(Integer)}
        new_arr = []
        self.each_with_index do |num, i|
            self.each_with_index do |num_2, j|
                new_arr << [i,j] if j > i && num + num_2 == 0
            end
        end
        new_arr
    end

    def my_transpose()
        self.each do |row|
            return nil if row.length != self.length
        end

        newArr = Array.new(self.length) {[]}
        i = 0

        while i < self.length
            j = 0 

            while j < self.length
                newArr[j] << self[i][j]
                j += 1
            end
            i += 1
        end
        return newArr
    end

end
def stock_picker (arr)
    new_arr = []
    most_pro = 0
    arr.each_with_index do |num, i|
        arr.each_with_index do |num_2, j|
            diff = num_2 - num
            if j > i && diff > most_pro
                new_arr = [i,j]
                most_pro = diff
            end
        end
    end
    new_arr
end

def tower_of_hanoi(arr)
    sm_disc = 1
    med_disc = 2
    lg_disc = 3
    count = 0
    piles = [[lg_disc,med_disc,sm_disc], [],[]]

    until piles == [[],[],[lg_disc,med_disc,sm_disc]]
        begin
            puts "Please pick a pole #"
            usr_in_1 = gets.chomp.to_i    
            raise InvalidInput if piles[usr_in_1].empty?
            valid_input(usr_in_1)
        rescue InvalidInput
            
            re
            
        end
        
        begin
        usr_in_2 = gets.chomp.to_i

        rescue
            

        count += 1
    end

end

def valid_input?(input)
    raise InvalidInput unless (1..3).to_a.include?(input)
    return true
end

def valid_move(disk_1, disk_2)
    raise InvalidMove if disk_1 > disk_2
    return true
end
# p [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
# p [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]