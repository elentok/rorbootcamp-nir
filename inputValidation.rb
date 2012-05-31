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

