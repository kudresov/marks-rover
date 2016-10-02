class MoveForwardCommand
  def execute(robot)
    location = robot.location
    case location.orientation
      when Orientation::NORTH
        robot.move_to Location.new(location.x, location.y + 1, location.orientation)
      when Orientation::EAST
        robot.move_to Location.new(location.x + 1, location.y, location.orientation)
      when Orientation::SOUTH
        robot.move_to Location.new(location.x, location.y - 1, location.orientation)
      when Orientation::WEST
        robot.move_to Location.new(location.x - 1, location.y, location.orientation)
      else
        raise ArgumentError 'Invalid orientation'
    end
  end
end