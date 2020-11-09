# Source: https://launchschool.com/exercises/0f677535

# Write a method 'minilang' that will accept a correct program as a string
# 1. Initialize our stack (an array that we only push/pop)
# 2. initialize our register at 0 value
# 3. our valid commands are:
#     "push/pop" (push adds reg -> stack) // (pop removes stack top -> reg)
#     "add/sub/mult/div/mod" (all pop top stack val & do pop_val OPER register val)
#     "print" (output current register val)

def minilang(input)
  register = 0
  stack = []

  cmd_str = input.split
  cmd_str.each do |cmd|
    register = cmd.to_i if cmd == cmd.to_i.to_s # replace register if command is int
    case cmd
    when 'PUSH'
      stack.push(register)
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    when 'ADD'
      register = stack.pop + register
    when 'SUB'
      register = stack.pop - register
    when 'MULT'
      register = stack.pop * register
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop
    end
  end

  return nil # minilang shouldn't return anything
end

# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('6 PUSH')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT')
minilang('-3 PUSH 5 SUB PRINT')
