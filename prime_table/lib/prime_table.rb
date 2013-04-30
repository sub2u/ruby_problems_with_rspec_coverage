class Integer < Numeric
    def is_prime?
        return false if self <= 1
        2.upto(Math.sqrt(self).to_i) do |x|
            return false if self%x == 0
        end 
        true
    end 

    def next_prime
        n = self+1
        n = n + 1 until n.is_prime?
        n   
    end 
end

class PrimeTable
def initialize(n)
e = Enumerator.new do |y|
    n = 2
    loop do
        y << n
        n = n.next_prime
    end
end
@req_num = n
@primes = e.take n
end

def process
@res_array = Array.new(@req_num+1){Array.new(@req_num+1){0}}

@res_array.each_with_index do |row,i| 
  row.each_with_index do |col,j| 
    if i == 0 && j == 0
      @res_array[i][j] = 0
    elsif i == 0
      @res_array[i][j] = @primes[j-1]
    elsif j == 0
      @res_array[i][j] = @primes[i-1]
    else
      @res_array[i][j] = @res_array[i][0] * @res_array[0][j]
    end
  end
end
end

def display
@res_array.each do |row|
  row.each_with_index do |col,j|
    spc = " " * (@res_array[-1][j].to_s.length - col.to_s.length)
    print col.to_s+spc+" "
  end
  puts ""
end
end

end
puts "Enter N for prime table"
req_num = gets.chomp.to_i
prime_table = PrimeTable.new(req_num)
prime_table.process
prime_table.display
