require "./product"

class Inventory
  attr_reader :products

  def initialize
    @products = []
  end

  def run
    loop do
      puts " Another Great Influence LLC Inventory"
      puts "1. Add a product"
      puts "2. List all products"
      puts "3. Edit product"
      puts "4. Remove Product"
      puts "5. Exit"

      print "Choose an option: "

      
      input = gets
      break unless input 

      option = input.chomp.to_i
      puts "\n"

          case option
          when 1
   
            print "Enter number of products you would like to add:"
            number_of_product_to_add = gets.chomp.to_i

            add_many_products(number_of_product_to_add)
          when 2
            list_products
          when 3 
            edit_product
          when 4 
            remove_product
          when 5
            puts "You have successfully exited the program. Goodbye!"
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
 
    @products.each do|product|
      if product.name_of_product == name_of_product
        puts "This Product Exist"
        return
        

      end
    
    end

    @products << Product.new(type_of_product, name_of_product, quantity, price)
    puts "Product added successfully!"
  end
 
 def add_many_products(count)
    for i in 1..count
      add_product()
    end
    
  end


  def list_products
      if @products.empty?
        puts "No products in the collection."
      else
        puts "Products in the collection:"
        
          @products.each do |product|
            puts product
          end 
      end
  end 

  def edit_product
    if @products.empty?
      puts "No products in the collection to edit."
    else
      puts "Enter name of product to edit:"
      name_of_product = gets.chomp
      found = 0
      
      
        @products.each do |product|
          if name_of_product = product.name_of_product
            found += 1

            puts " Select information to edit"
            puts "1. Type of Product"
            puts "2. Quantity"
            puts "3. Price"
            puts "4. Exit"
            print "Choose an option: "

            
            puts "\n"
            puts product

            edit_option = gets.chomp.to_i


            case edit_option
                when 1
                  puts "Enter new type of Product"

                  edit_product = gets.chomp

                  product.type_of_product = edit_product

                when 2 
                  puts "Enter new quantity"

                  edit_quantity = gets.chomp

                  product.quantity = edit_quantity
                when 3
                  puts "Enter new price"

                  edit_price = gets.chomp

                  product.price = edit_price
                when 4 
                  puts "You have successfully exited edit."
                  break
                else
                  puts "Invalid Selection."
            end 

          end 

          #puts product
        end 

        if found = 0 
          puts "No products found" 
        end 
    end
end   
 
def remove_product 
  if @products.empty?
    puts "there are no products in the inventory"
    exit
  end
  
  @products.each do |product|
    puts product
  end
  
  puts "Enter product type to remove"
  puts "\n"
  remove_product = gets.chomp
  
  @products.delete_if{|a| a.type_of_product == remove_product}

end


end
