require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require './lib/pet'

class CustomerTest < MiniTest::Test
  def setup
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end

  def test_it_exists
    assert_instance_of Customer, @joel
  end

  def test_it_has_readable_attributes
    assert_equal "Joel", @joel.name
    assert_equal 2, @joel.id
  end

  def test_it_can_adopt_pets
    assert_equal [], @joel.pets
    @joel.adopt(@samson)
    assert_equal [@samson], @joel.pets
    @joel.adopt(@lucy)
    assert_equal [@samson, @lucy], @joel.pets
  end

  def test_it_can_be_charged
    assert_equal 0, @joel.outstanding_balance
    @joel.charge(15)
    assert_equal 15, @joel.outstanding_balance
    @joel.charge(7)
    assert_equal 22, @joel.outstanding_balance
  end
end
