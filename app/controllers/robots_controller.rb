class RobotsController < ApplicationController

  def index

  end

  def move
    payload = params[:payload]
    input_parser = InputParser.new
    mars = input_parser.parse payload
    mars.move_robots
    @robot_final_positions = mars.robot_positions
  end
end