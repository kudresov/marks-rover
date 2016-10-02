class InputParser
  def parse(input)
    raise ArgumentError.new('Input is empty') unless input
    commands_arr = input.split("\n").reject { |c| c.empty? || c == "\r"}
    surface_str = commands_arr.shift
    surface_arr = surface_str.strip.split(' ')
    @surface = Surface.new surface_arr[0].to_i, surface_arr[1].to_i

    robots = commands_arr.in_groups_of(2).map{|cs| create_robot(cs[0], cs[1])}
    Mars.new(robots)
  end

  def create_robot(location, commands)
    robot = Robot.from_string(location, @surface)
    parsed_commands = commands.strip.split('').map{|pc| parse_command(pc)}
    robot.pending_commands.concat(parsed_commands)
    robot
  end

  def parse_command(command_str)
    case command_str.upcase
      when 'F'
        MoveForwardCommand.new
      when 'R'
        TurnRightCommand.new
      when 'L'
        TurnLeftCommand.new
      else
        raise ArgumentError 'Command is not supported for parsing'
    end
  end
end