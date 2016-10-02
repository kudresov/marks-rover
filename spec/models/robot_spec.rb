require 'rails_helper'

describe Robot do
  before(:each) do
    @surface = Surface.new(20, 10)
    location = Location.new(5, 5, Orientation::NORTH)
    @robot = Robot.new location, @surface
    @mars = Mars.new([@robot])
  end

  it 'should have no pending commands after executing them' do
    command = MoveForwardCommand.new
    @robot.pending_commands << command
    @robot.execute_pending_commands
    expect(@robot.pending_commands.length).to eq(0)
  end

  it 'executing move forward command should move robot up' do
    command = MoveForwardCommand.new
    @robot.pending_commands << command
    @robot.execute_pending_commands
    expect(@robot.location).to have_attributes(x: 5, y: 6, orientation: Orientation::NORTH)
  end

  it 'execute turn right command should turn robot right' do
    command = TurnRightCommand.new
    @robot.pending_commands << command
    @robot.execute_pending_commands
    expect(@robot.location).to have_attributes(x: 5, y: 5, orientation: Orientation::EAST)
  end

  it 'execute turn right command should turn robot left' do
    command = TurnLeftCommand.new
    @robot.pending_commands << command
    @robot.execute_pending_commands
    expect(@robot.location).to have_attributes(x: 5, y: 5, orientation: Orientation::WEST)
  end

  it 'keeps last location when moving of the ground' do
    commands = Array.new(10) {|_| MoveForwardCommand.new}
    @robot.pending_commands.concat commands
    @robot.execute_pending_commands
    expect(@robot.location).to have_attributes(x: 5, y: 10, orientation: Orientation::NORTH)
    expect(@robot.is_lost).to be(true)
  end

  it 'prints correct string when robot is lost' do
    commands = Array.new(10) {|_| MoveForwardCommand.new}
    @robot.pending_commands.concat commands
    @robot.execute_pending_commands
    expect(@robot.to_s).to eq('5 10 N LOST')
  end

  it 'second robot should not fall of the grid' do
    commands = Array.new(10) {|_| MoveForwardCommand.new}
    @robot.pending_commands.concat commands
    @robot.execute_pending_commands

    location2 = Location.new(5, 5, Orientation::NORTH)
    robot2 = Robot.new location2, @surface
    robot2.pending_commands.concat commands
    robot2.execute_pending_commands
    expect(robot2.to_s).to eq('5 10 N')
  end
end