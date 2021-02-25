require 'mocha'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/garage'
require './lib/owner'
require './lib/car'


class GarageTest < Minitest::Test

  def test_it_exists
    garage = Garage.new('Totally Safe Parking')

    assert_instance_of Garage, garage
  end

  def test_it_has_attributes
    garage = Garage.new('Totally Safe Parking')

    assert_equal "Totally Safe Parking", garage.name
  end

  def test_it_has_no_customers_by_default
    garage = Garage.new('Totally Safe Parking')

    assert_equal [], garage.customers
  end

  def test_it_can_add_customer
    # skip
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal [owner_1, owner_2], garage.customers
  end

  def test_it_can_display_all_cars_in_garage
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal 4, garage.all_cars.length
  end

  def test_it_can_display_cars_by_make
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)


    assert_equal Hash, garage.cars_by_make.class
  end

  def test_it_can_display_oldest_cars
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal 2, garage.oldest_cars.length
  end

  def test_it_can_display_cars_in_year_range
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')

    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal 3, garage.cars_in_range(1967..2020).length
  end

end
