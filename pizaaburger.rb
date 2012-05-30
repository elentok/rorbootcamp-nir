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

	

	def order
		puts "Your Name :" 
	    	@name = gets 
		puts "Your Phone number:" 
	    	@phone = gets 
		puts "Your topings:" 
	    	@topings = gets 
		puts "amount of pizzas:" 
	    	@amount= gets 
		@to_s
	end
	
	def to_s
		if(@amount > 1)
			result = "#{@amount} pizzas with "#{@topings}\n"
		elsif(@amount == 1)
			result = "1 pizza with "#{@topings}\n"
		result += "#{@name},#{phone}" 
		end
	end
end

if __FILE__ == $0
        pizOrder = PizzaOrder.new
	pizOrder.order
	pizOrder.to_s

end
