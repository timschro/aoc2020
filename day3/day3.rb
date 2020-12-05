# https://adventofcode.com/2020/day/3

def set_map(file)
  $map = File.read(file).split("\n")
end

def find_trajectory(start_x=0, start_y=0, right, down)
  x = start_x + right
  x = x - $map[0].length if x >= $map[0].length
  y = start_y + down
  $map[y][x] = "O" if $map[y][x] == "."
  $map[y][x] = "X" if $map[y][x] == "#"
  find_trajectory(x,y,right,down) unless y + 2 > $map.length
end

def calculate_trees(right=3,down=1)
  set_map($filename)
  find_trajectory(0,0,right,down)
  $map.each{|y| puts y}
  $map.join.count("X")
end

def calculate_trees_multiple
  product=1
  [[1,1],[3,1],[5,1],[7,1],[1,2]].each do |slope|
     product = product * calculate_trees(slope[0],slope[1])
  end
  product
end

if $0 == __FILE__
$filename = "day3_input.txt"
 puts "Result Part 1: #{calculate_trees}"
 puts "Result Part 2: #{calculate_trees_multiple}"
end

########## RSpec tests
# Run tests: ´rspec day3.rb´
require "rspec"

RSpec.describe "Day 3: Toboggan Trajectory" do
  $filename = "day3_input_test.txt"
  
  it "find the way with 3 right and 1 down" do
    expect(calculate_trees).to eq(7)
  end
  
  it "find the product of all ways" do
    expect(calculate_trees_multiple).to eq(336)
  end
end