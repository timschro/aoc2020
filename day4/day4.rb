# https://adventofcode.com/2020/day/4


FIELDS =  %w(byr iyr eyr hgt hcl ecl pid)

def check_passport(filename, validate = false)

  read_input(filename)
  
  count_valids = 0
  $passports.each do |p|
    check = true
    
   FIELDS.each do |key|
      if p.include?(key) && check
        check = valid?(key,p[key]) if validate
      else
        check = false 
        next
      end   
    end
    count_valids = count_valids + 1 if check
  end
  count_valids
end

def valid?(key, value)
    
  begin
    case key
    when "byr"
      return (1920..2002).include?(value.to_i)
    when "iyr"
      return (2010..2020).include?(value.to_i)
    when "eyr"
      return (2020..2030).include?(value.to_i)
    when "hgt"
      return (59..76).include?(value.to_i) if value.include?("in")
      return (150..193).include?(value.to_i) if value.include?("cm")
    when "hcl"
     # return /(hcl:)(\A#[0-9a-f]{6})/.match?(passport)
     return value.match?(/\A#[0-9a-f]{6}\z/)
    when "ecl"
      return %w(amb blu brn gry grn hzl oth).include?(value)
    when "pid"
      return value.match?(/\A\d{9}\z/)
    when "cid"
      return true
    else
      return false
    end
  rescue
    return false
  end
  false
end


def read_input(filename)
  $passports = File.read(filename).split("\n\n").map do |raw_passport|
    raw_passport.scan(/(\w+{3})\:(\S+)/).to_h
  end
end




if $0 == __FILE__

 puts "Result Part 1: #{check_passport("day4_input.txt")}"
 puts "Result Part 2: #{check_passport("day4_input.txt",true)}"
 
end


########## RSpec tests
# Run tests: ´rspec day4.rb´

require "rspec"

RSpec.describe "Day 2: Password Philosophy" do
  
  it "2 passports are valid" do
    expect(check_passport("day4_input_test.txt")).to eq(2)
  end
  
  it "2 passport have validated data" do
    expect(check_passport("day4_input_test.txt",true)).to eq(2)
  end
  
end