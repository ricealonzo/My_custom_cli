class Product
  attr_accessor :type_of_product, :name_of_product, :quantity, :price

  def initialize(type_of_product, name_of_product, quantity, price)
    @type_of_product = type_of_product
    @name_of_product = name_of_product
    @quantity = quantity
    @price = price
  end

  def to_s
    "Type of product: #{type_of_product} \nName of product: #{@name_of_product}\nQuantity: #{quantity}\nPrice: #{price}"
  end
end
