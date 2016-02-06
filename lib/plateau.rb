class Plateau

  attr_reader :max_x, :max_y

  def initialize(args={})
    self.max_x = args[:max_x]
    self.max_y = args[:max_y]
  end

  def max_x= (arg=nil)
    raise NotAPositiveInteger unless positive_integer? arg
    @max_x = arg
  end

  def max_y= (arg=nil)
    raise NotAPositiveInteger unless positive_integer? arg
    @max_y = arg
  end

  def positive_integer?(arg=nil)
    !arg.nil? && arg.is_a?(Integer) && (arg > 0)
  end

  class NotAPositiveInteger < ArgumentError; end

end