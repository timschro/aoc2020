# https://adventofcode.com/2020/day/1


def multiply(sum, values)
  values.each do |x|
    x = x.chomp.to_i
    values.each do |y|
      y = y.chomp.to_i
      return x * y if x + y == sum
    end
  end
end


def multiply_three(sum, values)
  values.each do |x|
    x = x.chomp.to_i
    values.each do |y|
      y = y.chomp.to_i
      values.each do |z|
         z = z.chomp.to_i
        return x * y * z if x + y + z == sum
      end
    end
  end
end



if $0 == __FILE__
  puts "Result: #{multiply(2020, File.readlines("day1_input.txt"))}"
  puts "Result Part 2: #{multiply_three(2020, File.readlines("day1_input.txt"))}"
  
end


########## RSpec tests
# Run tests: ´rspec day1.rb´

require "rspec"

RSpec.describe "Day 1: Expense report" do
  
  input_test = "6"

  it "multiply results in 514579" do
    expect(multiply(2020,File.readlines("day1_input_test.txt"))).to eq(514579)
  end
  
  it "multiply_three results in 241861950" do
    expect(multiply_three(2020,File.readlines("day1_input_test.txt"))).to eq(241861950)
  end
 
end
