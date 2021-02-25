class Owner
  attr_reader :name,
              :occupation,
              :cars

  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(car)
    car_list = car.split(" ")
    car_stats = {}
    car_stats[:description] = car_list.drop(1).join(" ")
    car_stats[:year] = car_list.shift
    @cars << Car.new(car_stats)
  end

end
