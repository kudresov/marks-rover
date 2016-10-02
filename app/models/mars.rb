class Mars
  attr_reader :robots

  def initialize(robots)
    @robots = robots
  end

  def move_robots
    @robots.each { |robot| robot.execute_pending_commands }
  end

  def robot_positions
    @robots.map {|r| r.to_s}
  end
end