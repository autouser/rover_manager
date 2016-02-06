class Rover

  attr_reader :x, :y, :orientation, :plateau

  ORIENTATIONS = %w{ N E S W }

  def initialize(args={})
    self.plateau      = args[:plateau]
    self.x            = args[:x]
    self.y            = args[:y]
    self.orientation  = args[:orientation]
  end

  def x= (arg=nil)
    raise RoverManager::NotAPositiveInteger unless RoverManager.positive_integer? arg
    raise Rover::OutOfRange if (self.plateau.max_x < arg) || (arg < 0)
    @x = arg
  end

  def y= (arg=nil)
    raise RoverManager::NotAPositiveInteger unless RoverManager.positive_integer? arg
    raise Rover::OutOfRange if (self.plateau.max_y < arg) || (arg < 0)
    @y = arg
  end

  def orientation= (arg=nil)
    raise Rover::InvalidOrientation unless ORIENTATIONS.include?(arg)
    @orientation = arg
  end

  def plateau= (arg)
    raise Rover::InvalidPlateau unless arg.kind_of? Plateau
    @plateau = arg
  end

  def rotate_right
    idx = ORIENTATIONS.find_index(orientation)
    self.orientation = ORIENTATIONS[idx + 1] || ORIENTATIONS[0]
  end

  def rotate_left
    idx = ORIENTATIONS.find_index(orientation)
    self.orientation = ORIENTATIONS[idx-1]
  end

  def move
    if orientation == 'N'
      self.y += 1
    elsif orientation == 'S'
      self.y -= 1
    elsif orientation == 'E'
      self.x += 1
    elsif orientation == 'W'
      self.x -= 1
    end
  end

  def output
    "#{x} #{y} #{orientation}"
  end

  class InvalidOrientation < ArgumentError; end
  class InvalidPlateau < ArgumentError; end
  class OutOfRange < ArgumentError; end

end