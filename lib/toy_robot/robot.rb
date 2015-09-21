module ToyRobot
  # Robot of the game that will place on playground
  class Robot
    # constants of direction
    NORTH = 'n'.freeze
    EAST  = 'e'.freeze
    SOUTH = 's'.freeze
    WEST  = 'w'.freeze

    attr_accessor :name

    # Init robot with a name
    # Position includes coordinate (x, y) and direction (f)
    def initialize(playground, name='BB8')
      @playground = playground
      @name = name
      @position = {:x => nil, :y => nil, :f => nil}
    end

    # Set position of the robot
    # Return nil on invalid input values
    #
    # Params:
    # - +x+ X-coordinate
    # - +y+ Y-coordinate
    # - +f+ Direction
    def set_position(x, y, f)
      if !x.is_a?(Integer) ||
         !y.is_a?(Integer) ||
         !(direction = identify_direction(f))
         return nil
      end

      @position = {
        :x => x,
        :y => y,
        :f => direction,
      }
    end

    # Check if position is set
    # Return true with both coordinate (x, y) and direction are set
    def position?
      @position[:x] && @position[:y] && @position[:f]
    end

    # Get position
    # Return nil if position is not set
    def position
      position? ? @position : nil
    end

    # Move forward according to direction
    #
    # Params:
    # - +step+ number of steps to move
    def step_forward!(step=1)
      verify_position!
      moving!(step) { |pos, step| pos + step }
    end

    # Move backward according to direction
    #
    # Params:
    # - +step+ number of steps to move
    def step_backward(step=1)
      return nil unless position?
      moving!(step) { |pos, step| pos - step }
    end

    # Turn left and return new position
    # Return nil if position is not set
    def turn_left
      return nil unless position?
      @position[:f] = direction_sequence[direction_sequence.index(@position[:f]) - 1]
      @position
    end

    # Turn right and return new position
    # Return nil if position is not set
    def turn_right
      return nil unless position?
      if (index = direction_sequence.index(@position[:f]) + 1) >= direction_sequence.count
        index -= direction_sequence.count
      end
      @position[:f] = direction_sequence[index]
      @position
    end

    private

    def identify_direction(f)
      case f.downcase
        when 'n', 'north' then NORTH
        when 'e', 'east'  then EAST
        when 's', 'south' then SOUTH
        when 'w', 'west'  then WEST
        else nil
      end
    end

    def moving!(step, &block)
      old_position = @position.dup

      case @position[:f]
        when NORTH then @position[:y] = yield(@position[:y], step)
        when EAST  then @position[:x] = yield(@position[:x], step)
        when SOUTH then @position[:y] = yield(@position[:y], step * -1)
        when WEST  then @position[:x] = yield(@position[:x], step * -1)
      end

      unless @playground.valid_coordinate?(@position[:x], @position[:y])
        @position = old_position
        raise ReachedBoundaryError, 'Robot reached boundary'
      end

      @position
    end

    def direction_sequence
      [NORTH, EAST, SOUTH, WEST]
    end

    def verify_position!
      raise NoPositionError, 'Robot is not on playground' unless position?
    end
  end
end

class NoPositionError < RuntimeError; end
class ReachedBoundaryError < RuntimeError; end
