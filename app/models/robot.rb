class Robot
  attr_reader :location, :pending_commands, :is_lost, :surface

  def initialize(location, surface)
    @location = location
    @pending_commands = Array.new
    @surface = surface
    @is_lost = false
  end

  def self.from_string(location, surface)
    location_arr = location.split(' ')
    location = Location.new(location_arr[0].to_i, location_arr[1].to_i, Orientation::from_string(location_arr[2]))
    Robot.new(location, surface)
  end

  def move_to(location)
    if @surface.is_known_off_grid? location
      return
    end

    if @surface.is_within_grid? location
      @location = location
    else
      @is_lost = true
      @surface.known_off_grid_locations << location
    end
  end

  def execute_pending_commands
    @pending_commands.each {|cmd| cmd.execute(self)}
    @pending_commands.clear
  end

  def to_s
    if @is_lost
      @location.to_s + ' LOST'
    else
      @location.to_s
    end
  end
end