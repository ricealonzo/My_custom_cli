require "./product"
class Inventory

  def initialize
    @products = []
  end

  def run
    loop do
      
      puts " Another Great Influence LLC Inventory"
      puts "1. Add a product"
      puts "2. List all products"
      puts "3. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
      
      case option
      when 1
        add_product
      when 2
        list_products
      when 3
        puts "You have succefully exited the program. Goodbye!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  private

  def add_product
    print "Enter type of product: "
    type_of_product = gets.chomp
    
    print "Enter name of product: "
    name_of_product = gets.chomp
    
    print "Enter quantity of product: "
    quantity = gets.chomp

    print "Enter price of product: "
    price = gets.chomp
    
    
    
    @products << Product.new(type_of_product, name_of_product, quantity, price )
    puts "product added successfully!"
  end

  def list_products
    puts "products in the collection:"
    @products.each do |product|
      puts product
    end
  end
end
