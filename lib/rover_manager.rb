require "rover_manager/version"
require "plateau"
require "rover"

module RoverManager

  MOVEMENT_ACTIONS = {
    'L' => :rotate_left,
    'R' => :rotate_right,
    'M' => :move
  }

  def self.command(input)
    lines = input.split "\n"
    output = ''

    # Init plateau
    plateau_coords_raw = lines.shift.strip.split(/\s+/)
    raise WrongPlateau if (plateau_coords_raw[0] !~ /^(\d+)$/) || (plateau_coords_raw[1] !~ /^(\d+)$/)
    plateau_coords = plateau_coords_raw.map(&:to_i)

    plateau = Plateau.new max_x: plateau_coords[0], max_y: plateau_coords[1]

    while !lines.empty?

      # Init rover
      begin
        (x,y,orientation) = lines.shift.strip.split(/\s+/)
        rover = Rover.new plateau: plateau, x: x.to_i, y: y.to_i, orientation: orientation
      rescue
        raise WrongRoverPosition
      end

      # Move rover
      begin
        cmd = lines.shift.gsub!(/\s+/,'').split('')
        cmd.each do |code|
          action = MOVEMENT_ACTIONS[code] || raise("Invalid code '#{code}'")
          rover.send action
        end
        output += rover.output + "\n"
      rescue
        raise RoverCantMove
      end
    end

    output
  end
  
  def self.positive_integer?(arg=nil)
    !arg.nil? && arg.is_a?(Integer) && (arg > -1)
  end

  class NotAPositiveInteger < ArgumentError; end
  class WrongPlateau < RuntimeError; end
  class WrongRoverPosition < RuntimeError; end
  class RoverCantMove < RuntimeError; end
end
