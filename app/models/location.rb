class Location
  attr_reader :x, :y, :orientation

  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  def to_s
    "#{@x} #{@y} #{Orientation.to_string(orientation)}"
  end

  def is_same_point?(location)
    location.x == @x && location.y == @y
  end
end