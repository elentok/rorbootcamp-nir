class Pizzaburger
	def menu 
		puts "Welcome to PizaaBurger"
		puts "What would you like to do???"
		puts "----------------------------"
		puts "1. Order a pizza"
		puts "2. Order a burger"
		puts "3. List all orders"
		puts "4. Cancel an order"
		puts "5. Exit"
	end
end

class BasicOrder
	attr_accessor :name
	attr_accessor :phone
end

class PizzaOrder< BasicOrder 
	attr_accessor :topings
	attr_accessor :amount

	def initialize(name,phone,topings,amount)
	    @name = name
	    @phone= phone 
	    @topings =topings 
	    @amount = amount
	end
	

	def order
		puts "Your Name :" 
	end
end

if __FILE__ == $0
  pizOrder = PizzaOrder.new("Nir","0578170214","onion",3)
  pizaabur= Pizzaburger.new
  pizaabur.menu
end
