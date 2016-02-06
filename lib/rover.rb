class Rover

  attr_reader :x, :y, :orientation, :plateau

  ORIENTATIONS = %w{ N O S W }

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

  class InvalidOrientation < ArgumentError; end
  class InvalidPlateau < ArgumentError; end
  class OutOfRange < ArgumentError; end

end