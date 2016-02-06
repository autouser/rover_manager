class Rover

  attr_reader :x, :y, :orientation, :plateau

  ORIENTATIONS = %w{ N O S W }

  def initialize(args={})
    self.x            = args[:x]
    self.y            = args[:y]
    self.orientation  = args[:orientation]
    self.plateau      = args[:plateau]
  end

  def x= (arg=nil)
    raise RoverManager::NotAPositiveInteger unless RoverManager.positive_integer? arg
    @x = arg
  end

  def y= (arg=nil)
    raise RoverManager::NotAPositiveInteger unless RoverManager.positive_integer? arg
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

end