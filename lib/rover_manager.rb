require "rover_manager/version"
require "plateau"
require "rover"

module RoverManager
  
  def self.positive_integer?(arg=nil)
    !arg.nil? && arg.is_a?(Integer) && (arg > -1)
  end

  class NotAPositiveInteger < ArgumentError; end

end
