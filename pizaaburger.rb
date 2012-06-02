# DAVID: 
# 1. use 'require_relative "input_validation'" instead'
# 2. file names should be in snake case: "input_validation" instead of "inputValidation"
load 'inputValidation.rb'
load 'orders.rb'
require 'yaml'

# DAVID: class names in camel case: "PizzaBurger" (each word starts with a capital letter)
class Pizzaburger
  # DAVID: if the constructor does nothing, don't put a constructor
  def initialize
  end

  # DAVID: method names in snake case (load_orders_from_yaml_file)
  def loadOrdersFromYamlFile
    @orders = begin
      YAML.load(File.open(ORDERSYAMLFILE_CONST))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end
  end

  # DAVID: 
  # 1. separate words with underscores: "ORDERS_YAML_FILE"
  # 2. lose the "_CONST" suffix
  ORDERSYAMLFILE_CONST = 'orders.yaml'

  # DAVID: print_menu
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
  
  # DAVID: list_all_orders
  def listAllOrders
      puts "The current orders Are"
      @orders.each_with_index do |order,i| 
        # DAVID: puts "#{i+1}) #{order}"
        # 1. don't contcatenate strings (+)
        # 2. no need to add ".to_s", it's implicit
        puts "#{i+1})" + order.to_s
      end
  end
  
  # DAVID: cancel_order
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
      # DAVID: extract this line to a method (save_orders or something)
      File.open(ORDERSYAMLFILE_CONST, "w") {|f| f.write(@orders.to_yaml) }
      Process.exit
    else
      puts "please choose the relevant option"
    end

    menu
	end

end

# DAVID: I usually do something like this:
#
#   def main
#     ...
#   end
#
#   main if __FILE__ == $0
#
# it's a little clearer
if __FILE__ == $0
  # DAVID: don't use shortcut names, they're unclear
  pizpurg = Pizzaburger.new
  pizpurg.loadOrdersFromYamlFile
  pizpurg.menu
end
