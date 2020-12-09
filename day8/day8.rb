test="nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6"
@commands=test.split("\n")
#@commands = File.read("input.txt").split("\n")



def execute(line, commands)
 return false if line >= commands.length
  cmd,int = commands[line].split(" ")
  #p "#{@accumulator} - #{cmd} #{int}"
  return [@accumulator, false] if @done_lines.include?(line)
  @done_lines << line
    case cmd
    when "nop"
       execute(line + 1, commands)
    when "acc"
      @accumulator = @accumulator + int.to_i
       execute(line + 1, commands)
    when "jmp"
       execute(line + int.to_i, commands)
    end
    return line >= commands.length
end

def part1
  @accumulator=0
  @done_lines = []
  execute(0, @commands)
  @accumulator
end



puts "Result Part 1: #{part1}"
