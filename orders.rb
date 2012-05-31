class BasicOrder
  attr_accessor :name
  attr_accessor :phone
end

class PizzaOrder< BasicOrder 
  attr_accessor :topings
  attr_accessor :amount

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
    if(@amount > 1)
      result = "#{@amount} pizzas with #{@topings}\n"
    elsif(@amount == 1)
      result = "1 pizza with #{@topings}\n"
    end

    result += "#{@name},#{phone}" 
  end
end

class BurgerOrder< BasicOrder 
  attr_accessor :taste
  attr_accessor :fries

  def order
    puts "Your Name :" 
    @name = gets.chomp
    puts "Your Phone number:" 
    @phone = gets.chomp 
    puts "How would you like your burger:" 
    @taste = gets.chomp 
    puts "Would you like fries:" 
    @fries = readBoolean
    self
  end

  def to_s
    result = "Burger"
    if @fries =~ /^[yY]/ 
      result += " with fries"
    end
    result += " (#{@taste})\n" 
    result += "#{@name},#{@phone}" 
  end
end
