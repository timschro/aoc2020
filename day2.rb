# https://adventofcode.com/2020/day/1


def check_pw(values)
  count = 0
  values.each do |line|
    pw = /[a-z]{2,}/.match(line).to_s
    quantifiers = (line).scan(/\d+/)
    char = /[a-z]{1}/.match(line).to_s
    hit = (pw.count(char) >= quantifiers[0].to_i && pw.count(char) <= quantifiers[1].to_i)
    count = count + 1 if hit
  end
  count
end

def check_pw_part2(values)
  count = 0
  values.each do |line|
    pw = /[a-z]{2,}/.match(line).to_s
    quantifiers = (line).scan(/\d+/)
    char = /[a-z]{1}/.match(line).to_s
    
    
    hit = (pw[quantifiers[0].to_i - 1] == char && pw[quantifiers[1].to_i - 1] != char) ||  (pw[quantifiers[0].to_i - 1] != char && pw[quantifiers[1].to_i - 1] == char)
    count = count + 1 if hit
    
#    p "#{line} #{hit} #{pw[quantifiers[0].to_i - 1]} #{pw[quantifiers[1].to_i - 1]}"
  end
  count
end


if $0 == __FILE__
 puts "Result: #{check_pw(File.readlines("day2_input.txt"))}"
 puts "Result Part 2: #{check_pw_part2(File.readlines("day2_input.txt"))}"
end


########## RSpec tests
# Run tests: ´rspec day1.rb´

require "rspec"

RSpec.describe "Day 2: Password Philosophy" do
  
  it "2 passwords are valid" do
    expect(check_pw(File.readlines("day2_input_test.txt"))).to eq(2)
  end
  
  it "2 passwords are valid (new rule)" do
    expect(check_pw_part2(File.readlines("day2_input_test.txt"))).to eq(1)
  end

 
end