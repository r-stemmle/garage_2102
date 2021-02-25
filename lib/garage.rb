class Garage
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def cars_in_range(range)
    cars_in_range = []
    @customers.each do |customer|
      customer.cars.each do |car|
        cars_in_range << car if range.include?(car.year.to_i)
      end
    end
    cars_in_range
  end

  def oldest_cars
    oldest_cars = []
    @customers.each do |customer|
      oldest_cars << customer.vintage_cars
    end
    oldest_cars
  end

  def cars_by_make
    cars = Hash.new {|hash, key| hash[key] = [] }
    @customers.each do |customer|
      customer.cars.each do |car|
        cars[car.make] << car
      end
    end
    cars
  end

  def all_cars
    cars = []
    @customers.each do |customer|
      customer.cars.each do |car|
        cars << car
      end
    end
    cars
  end

  def add_customer(customer)
    @customers << customer
  end

end
