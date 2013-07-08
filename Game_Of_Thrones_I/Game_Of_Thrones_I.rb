class Purmutation
    attr_reader :rand_str
    def initialize(input)
        @rand_str = input
    end

    def permutation?
        even = even_odd
        od_char = per_patt
        if (even && od_char == 0) || (!even && od_char == 1)
            return "YES"
        end
        "NO"
    end
    
    private
    
    def even_odd
        rand_str.length.even?
    end
    
    def per_patt
        odd_val = 0
        pat_str = rand_str.split('')
        while pat_str != []
            pat_char = pat_str.shift
            pat_match = pat_str.index(pat_char)
            pat_str.delete_at(pat_match) unless pat_match.nil?
            odd_val += 1 if pat_match.nil?
        end
        odd_val
    end
    
end

rand_str = gets.chomp
permutation = Purmutation.new(rand_str)
puts permutation.permutation?
