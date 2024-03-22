require 'minitest/autorun'
require   './inventory'
class MyTest < Minitest::Test
  def test_user_input
    # Simulate user input by overriding $stdin with a StringIO object
    simulated_user_input = StringIO.new
    $stdin = simulated_user_input

    # Call the method that uses gets
    output_source = Inventory.new
    output = output_source.run

    # Restore $stdin so other tests are not affected
    $stdin = STDIN

    # Assert the expected outcome
    assert_equal "expected output", output
  end
end
