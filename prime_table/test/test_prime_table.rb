$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
  require 'prime_table'

describe PrimeTable, "#process" do
  it "should give 4X4 array" do
    bowling = PrimeTable.new(3)
    bowling.process.size.should eq(4)
  end

  it "should give all able as array of " do
    bowling = PrimeTable.new(3)
    bowling.process.should eq([[0, 2, 3, 5], [2, 4, 6, 10], [3, 6, 9, 15], [5, 10, 15, 25]])
  end

  it "should give 3 prime numbers end element as 5*5 = 25 " do
    bowling = PrimeTable.new(3)
    bowling.process[-1][-1].should eq(25)
  end

  it "should equal res[i][j] with res[j][i] " do
    bowling = PrimeTable.new(3)
    bowling.process[1][2].should eq(bowling.process[2][1])
  end

end
