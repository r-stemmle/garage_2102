class Owner
  attr_reader :name,
              :occupation,
              :cars

  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
    @is_customer = false
  end

  def is_customer?
    @is_customer
  end

  def start_customer
    @is_customer = true
  end

  def stop_customer
    @is_customer = false
  end

  def buy(car)
    car_list = car.split(" ")
    car_stats = {}
    car_stats[:description] = car_list.drop(1).join(" ")
    car_stats[:year] = car_list.shift
    @cars << Car.new(car_stats)
  end

  def vintage_cars
    @cars.find_all do |car|
      car.age > 25
    end
  end

end
