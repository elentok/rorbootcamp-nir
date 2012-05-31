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
	

	def order
		puts "Your Name :" 
	    	@name = gets.chomp
		puts "Your Phone number:" 
	    	@phone = gets.chomp 
		puts "Your topings:" 
	    	@topings = gets.chomp 
		puts "amount of pizzas:" 
	    	@amount= readInteger
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

if __FILE__ == $0
        pizOrder = PizzaOrder.new
	pizOrder.order
	puts pizOrder.to_s

end
