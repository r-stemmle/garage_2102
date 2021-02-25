class Car
  attr_reader :make,
              :model,
              :color,
              :year,
              :age

  def initialize(stats)
    @make = stats[:description].split(" ")[1]
    @model = stats[:description].split(" ")[2]
    @color = stats[:description].split(" ")[0]
    @year = stats[:year]
    if year[0].to_i == 1
      @age = 121 - year[-2, 2].to_i
    elsif year[0].to_i == 2
      @age = 21 - year[-2, 2].to_i
    end
  end


end
