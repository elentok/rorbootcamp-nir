# DAVID: see my version below("read_integer")
# 1. no need to wait for the end of the loop to return
# 2. if you're reading an integer why are you using a regexp for a float?
def readInteger
  shouldReadInt = true
  while shouldReadInt do
    input = gets.chomp
    if input =~ /^[\d]+(\.[\d]+){0,1}$/
      shouldReadInt = false
    else
      puts "please enter a valid number" 
    end
  end
  return Integer(input)
end

def read_integer
  loop do
    input = gets.chomp
    return Integer(input) if input =~ /^\d+$/
    puts "please enter a valid number"
  end
end

# DAVID: see my version below ("read_boolean")
def readBoolean
  shouldReadbool = true
  while shouldReadbool do
    input = gets.chomp
    if input =~ /^[ynYN]/
      shouldReadbool = false
    else
      puts "please enter y for yes and n for no" 
    end
  end
    return input
end

def read_boolean
  loop do
    input = gets.chomp
    return input =~ /^[yY]$/ if input =~ /^[ynYN]$/
    puts "please enter y for yes and n for no" 
  end
end
