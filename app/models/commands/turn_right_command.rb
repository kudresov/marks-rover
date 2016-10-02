class TurnRightCommand
  def execute(robot)
    location = robot.location
    orientation = (location.orientation + 1) % 4
    robot.move_to Location.new(location.x, location.y, orientation)
  end
end