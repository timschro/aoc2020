# https://adventofcode.com/2020/day/5

$ids = []
REPLACEMENTS = {'F' => '0', 'B' => '1', 'R' => '1', 'L' => '0'}


def check_boardingpasses(passes)
  passes.each do |pass|
    pass.gsub!(Regexp.union(REPLACEMENTS.keys), REPLACEMENTS)
    $ids << pass[0,7].to_i(2) * 8 + pass[7,4].to_i(2)
  end
  $ids.max
end

def find_emptyseat
  $ids.min.upto($ids.max) {|i| return i unless $ids.include?(i)}
end


if $0 == __FILE__
 puts "Result Part 1: #{check_boardingpasses(File.readlines("input.txt"))}"
 puts "Result Part 2: #{find_emptyseat}"
end


########## RSpec tests
# Run tests: ´rspec day5.rb´

require "rspec"

RSpec.describe "Day 5: Binary Boarding" do
  it "Highest ID is 820" do
    expect(check_boardingpasses(File.readlines("test.txt"))).to eq(820)
  end
end