require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'

class PetTest < MiniTest::Test
  def setup
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end

  def test_it_exists
    assert_instance_of Pet, @samson
  end

  def test_it_has_readable_attributes
    assert_equal "Samson", @samson.name
    assert_equal :dog, @samson.type
    assert_equal 3, @samson.age
  end

  def test_it_can_be_fed
    assert_equal false, @samson.fed?
    @samson.feed
    assert_equal true, @samson.fed?
  end
end
