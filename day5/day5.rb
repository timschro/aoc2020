# https://adventofcode.com/2020/day/5
ids = []
REPLACEMENTS = {'F' => '0', 'B' => '1', 'R' => '1', 'L' => '0'}
File.readlines("input.txt").each do |pass|
  pass.gsub!(Regexp.union(REPLACEMENTS.keys), REPLACEMENTS)
  ids << pass[0,7].to_i(2) * 8 + pass[7,4].to_i(2)
end
seat = ids.min.upto(ids.max).select {|i| !ids.include?(i)}

puts "Result Part 1: #{ids.max}"
puts "Result Part 2: #{seat[0]}"