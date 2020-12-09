input="input.txt"
#input="test.txt"

preamble = input.eql?("test.txt") ? 5 : 25
numbers = File.read(input).split("\n").map(&:to_i)

result_p1 = "N/A"
numbers.each_cons(preamble + 1) do |n|
  last = n.pop
  result_p1 = last if n.combination(2).none? { |x| x[0]+x[1] == last}
end
puts "Result Part 1 #{result_p1}"

result_p2 = "N/A"
(0..(numbers.length - 1)).to_a.combination(2).to_a.each do |x|
  sum = []
  x[0].upto(x[1]) do |n|
    sum << numbers[n]
  end
  if sum.sum == result_p1
    result_p2 = sum.minmax.sum 
    break
  end
end
puts "Result Part 2 #{result_p2}"
