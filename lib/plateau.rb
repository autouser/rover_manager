class Plateau

  attr_reader :max_x, :max_y

  def initialize(args={})
    self.max_x = args[:max_x]
    self.max_y = args[:max_y]
  end

  def max_x= (arg=nil)
    raise RoverManager::NotAPositiveInteger unless RoverManager.positive_integer? arg
    @max_x = arg
  end

  def max_y= (arg=nil)
    raise RoverManager::NotAPositiveInteger unless RoverManager.positive_integer? arg
    @max_y = arg
  end

end