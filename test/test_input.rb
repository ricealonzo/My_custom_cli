# test/test_input.rb

require 'minitest/autorun'
require_relative '../inventory'
require 'stringio'

class TestUser < Minitest::Test
  def setup
    @inventory = Inventory.new
    @inputs = []
    @outputs = []
  end

  def test_add_product
  
    @inputs << "1\n"            
    @inputs << "Audio Interface\n"       
    @inputs << "Universal Audio\n"   
    @inputs << "7\n"             
    @inputs << "1300\n"         

    
    @outputs << "Product added successfully!\n"

  
    simulate_stdin(@inputs.join) do
      actual_output = capture_stdout { @inventory.run }
      assert_includes actual_output, @outputs.first
    end

    assert_equal 1, @inventory.products.size
    assert_equal "Universal Audio", @inventory.products.first.name_of_product
  end

  private

  def simulate_stdin(input)
    $stdin = StringIO.new(input)
    yield
  ensure
    $stdin = STDIN
  end

  def capture_stdout
    output = StringIO.new
    $stdout = output
    yield
    output.string
  ensure
    $stdout = STDOUT
  end
end
