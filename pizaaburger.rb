load 'inputValidation.rb'
load 'orders.rb'
class Pizzaburger

  def initialize
    @orders = Array.new
  end

  def printMenu
		puts "Welcome to PizaaBurger"
		puts "What would you like to do???"
		puts "----------------------------"
		puts "1. Order a pizza"
		puts "2. Order a burger"
		puts "3. List all orders"
		puts "4. Cancel an order"
		puts "5. Exit"
  end


	def menu 
    printMenu
    choice = readInteger

    case choice
    when 1
      newpizza = PizzaOrder.new.order
      @orders << newpizza
    when 2
      newburger = BurgerOrder.new.order
      @orders << newburger
    when 3
      puts "these are all the orders"
      @orders.each do |order| 
        puts order.to_s
      end
    else
      puts "user wants something else"
    end
    menu
	end

end

if __FILE__ == $0
  pizpurg = Pizzaburger.new
  pizpurg.menu
end
