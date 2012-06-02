load 'inputValidation.rb'
load 'orders.rb'
require 'yaml'

class Pizzaburger
  def initialize
  end

  def loadOrdersFromYamlFile
    @orders = begin
      YAML.load(File.open(ORDERSYAMLFILE_CONST))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end
  end

  ORDERSYAMLFILE_CONST = 'orders.yaml'

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
  
  def listAllOrders
      puts "The current orders Are"
      @orders.each_with_index do |order,i| 
        puts "#{i+1})" + order.to_s
      end
  end
  
  def cancelOrder
    listAllOrders
    puts "Which order would you like to cancel"
    orderToCancel = readInteger

    if orderToCancel > @orders.length
      puts "can't find order with number #{orderToCancel}"
    else
      @orders.delete_at(orderToCancel - 1)
    end
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
      listAllOrders
    when 4 
      cancelOrder
    when 5 
      File.open(ORDERSYAMLFILE_CONST, "w") {|f| f.write(@orders.to_yaml) }
      Process.exit
    else
      puts "please choose the relevant option"
    end

    menu
	end

end

if __FILE__ == $0
  pizpurg = Pizzaburger.new
  pizpurg.loadOrdersFromYamlFile
  pizpurg.menu
end
