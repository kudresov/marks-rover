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
end