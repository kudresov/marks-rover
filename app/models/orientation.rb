module Orientation
  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def self.from_string(value)
    case value.upcase
      when 'N'
        NORTH
      when 'E'
        EAST
      when 'S'
        SOUTH
      when 'W'
        WEST
      else
        raise ArgumentError 'can not parse string'
    end
  end

  def self.to_string(orientation)
    case orientation
      when 0
        'N'
      when 1
        'E'
      when 2
        'S'
      when 3
        'W'
      else
        raise ArgumentError 'can not parse orientation'
    end
  end
end