require 'rails_helper'

describe InputParser do
  before(:all) do
    @input_parser = InputParser.new
    @input = "5 3\n"\
             "1 1 E\n"\
             "RFRFRFRF\n\n"\
             "3 2 N\n"\
             "FRRFLLFFRRFLL\n\n"\
             "0 3 W\n"\
             "LLFFFLFLFL"
  end

  it 'should be of correct instance' do
    expect(@input_parser).to be_instance_of(InputParser)
  end

  it 'throws error when parsing nil' do
    expect { @input_parser.parse nil }.to raise_error(ArgumentError)
  end

  it 'should have correct surface defined' do
    result = @input_parser.parse @input
    expect(result.robots[0].surface).to have_attributes(width: 5, height: 3)
  end

  it 'should have correct number of robot commands' do
    result = @input_parser.parse @input
    expect(result.robots.length).to be 3
  end

  it 'first command set should have correct initial location' do
    result = @input_parser.parse @input
    expect(result.robots[0].location).to have_attributes(x: 1, y: 1, orientation: Orientation::EAST)
  end

  it 'should have a correct number of pending commands' do
    result = @input_parser.parse @input
    expect(result.robots[0].pending_commands.count).to eq(8)
  end

  it 'should have a correct type of pending commands' do
    result = @input_parser.parse @input
    expect(result.robots[0].pending_commands[0]).to be_a(TurnRightCommand)
    expect(result.robots[0].pending_commands.last).to be_a(MoveForwardCommand)
  end
end