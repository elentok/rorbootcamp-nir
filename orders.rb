class BasicOrder
  # DAVID: use a one-liner: "attr_accessor :name, :phone"
  attr_accessor :name
  attr_accessor :phone
end

# DAVID: space before and after "<" and the class names
class PizzaOrder< BasicOrder 
  # DAVID: use a one-liner: "attr_accessor :topings, :amount"
  attr_accessor :topings
  attr_accessor :amount

  # DAVID: I would move this code somewhere else
  # (it's UI, it shouldn't be a part of the model)
  def order
    puts "Your Name :" 
    @name = gets.chomp
    puts "Your Phone number:" 
    @phone = gets.chomp 
    puts "Your topings:" 
    @topings = gets.chomp 
    puts "amount of pizzas:" 
    @amount= readInteger
    self
  end

  def to_s
    # DAVID: no need for the parenthesis: "if @amount > 1"
    if(@amount > 1)
      result = "#{@amount} pizzas with #{@topings}\n"
    elsif(@amount == 1)
      result = "1 pizza with #{@topings}\n"
    end

    result += "#{@name},#{phone}" 
  end
end

# DAVID: space before and after "<" and the class names
class BurgerOrder< BasicOrder 
  # DAVID: use a one-liner: "attr_accessor :topings, :amount"
  attr_accessor :taste
  attr_accessor :fries

  # DAVID: I would move this code somewhere else
  # (it's UI, it shouldn't be a part of the model)
  def order
    puts "Your Name :" 
    @name = gets.chomp
    puts "Your Phone number:" 
    @phone = gets.chomp 
    puts "How would you like your burger:" 
    @taste = gets.chomp 
    puts "Would you like fries:" 
    # DAVID: store true or false, not strings
    @fries = readBoolean
    self
  end

  def to_s
    result = "Burger"
    # DAVID: store true or false, not strings, then just check "if @fries"
    # make this a one-liner:
    #   
    #     result += " with fries" if @fries
    #
    if @fries =~ /^[yY]/ 
      result += " with fries"
    end
    result += " (#{@taste})\n" 
    result += "#{@name},#{@phone}" 

    # DAVID: you're using "+=" too much
    # (every time you concatenate strings it allocates a new string
    # and copies everything to the new string)
    # use the #{var} thing instead
    # or use "<<"
    #
    # see: http://www.tricksonrails.com/2009/12/string-concatenation-performance-ruby-tricks-02/
  end
end
