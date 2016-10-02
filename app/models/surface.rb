class Surface
  attr_reader :width, :height, :known_off_grid_locations

  def initialize(width, height)
    @width = width
    @height = height
    @known_off_grid_locations = Array.new
  end

  def is_within_grid?(location)
    if location.x < 0 || location.y < 0
      return false
    end

    if location.x > width || location.y > height
      return false
    end

    true
  end

  def is_known_off_grid?(location)
    @known_off_grid_locations.any? {|l| l.is_same_point?(location)}
  end
end