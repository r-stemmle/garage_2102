require 'minitest/autorun'
require 'minitest/pride'
require './lib/owner'
require './lib/car'
require 'mocha'

class OwnerTest < Minitest::Test

  def test_it_exists
    owner_1 = Owner.new('Regina George', 'Heiress')

    assert_instance_of Owner, owner_1
  end

  def test_it_has_attributes
    owner_1 = Owner.new('Regina George', 'Heiress')

    assert_equal "Regina George", owner_1.name
    assert_equal "Heiress", owner_1.occupation
  end

  def test_it_can_have_different_attributes
    owner_1 = Owner.new('Regina George', 'Heiress')

    assert_equal [], owner_1.cars
  end

  def test_owner_can_buy_a_car
    owner_1 = Owner.new('Regina George', 'Heiress')

    owner_1.buy('1967 Green Ford Mustang')


    assert_instance_of Car, owner_1.cars.first

    owner_1.buy('2001 Silver BMW 3-Series')
    assert_equal 2, owner_1.cars.length

    owner_1.buy('1963 Red Chevrolet Corvette')
    assert_equal 3, owner_1.cars.length
  end

  def test_owner_can_have_vintage_cars
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    assert_instance_of Car, owner_1.cars.first

    owner_1.buy('2001 Silver BMW 3-Series')
    assert_equal 2, owner_1.cars.length

    owner_1.buy('1963 Red Chevrolet Corvette')
    assert_equal 3, owner_1.cars.length

    assert_equal 2, owner_1.vintage_cars.length
  end

  def test_it_can_be_a_customer
    owner_1 = Owner.new('Regina George', 'Heiress')
    assert_equal false, owner_1.is_customer?

    owner_1.start_customer
    assert_equal true, owner_1.is_customer?

    owner_1.stop_customer
    assert_equal false, owner_1.is_customer?
  end
end
