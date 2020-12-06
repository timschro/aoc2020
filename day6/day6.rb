# https://adventofcode.com/2020/day/6

def check_yes_anyone(filename)
  sum = 0
  read_input(filename).each do |d|
    sum = sum + d.split(//).reject{|x| x.eql?("\n")}.uniq.count
  end
  sum
end

def check_yes_everyone(filename)
  sum = 0
  read_input(filename).each do |g|  
    answers = []
    g.split("\n").each {|p| answers << p.split(//)}
    sum = sum + answers.inject(:&).length
  end
  sum
end

def read_input(filename)
  File.read(filename).split("\n\n")
end


if $0 == __FILE__
 puts "Result Part 1: #{check_yes_anyone("input.txt")}"
 puts "Result Part 2: #{check_yes_everyone("input.txt")}"
end


########## RSpec tests

require "rspec"
RSpec.describe "Day 6: Custom Customs" do
  
  it "sum of answered questions by anybody is 11" do
    expect(check_yes_anyone("test.txt")).to eq(11)
  end
  
  it "sum of answered questions by everybody is 6" do
    expect(check_yes_everyone("test.txt")).to eq(6)
  end
  
end