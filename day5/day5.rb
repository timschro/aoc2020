# https://adventofcode.com/2020/day/5

$occ_seats = Array.new(128, Array.new(8))
$ids = []

def check_boardingpasses(passes)
  passes.each do |pass|
    replacements = {
      'F' => '0', 'B' => '1',
      'R' => '1', 'L' => '0'}
    pass.gsub!(Regexp.union(replacements.keys), replacements)
    row = pass[0,7].to_i(2)
    col = pass[7,4].to_i(2)
    id = row * 8 + col
    $occ_seats[row][col] = id
    
    $ids << id
  end
  $ids.max
end

def find_emptyseat(passes)
  $ids.min.upto($ids.max) do |i|
    return i unless $ids.include?(i)
  end
end


if $0 == __FILE__
 puts "Result Part 1: #{check_boardingpasses(File.readlines("input.txt"))}"
 puts "Result Part 2: #{find_emptyseat(File.readlines("input.txt"))}"
 
end


########## RSpec tests
# Run tests: ´rspec day1.rb´

require "rspec"

RSpec.describe "Day 5: Binary Boarding" do
  
  it "Highest ID is 820" do
    expect(check_boardingpasses(File.readlines("test.txt"))).to eq(820)
  end
   
end