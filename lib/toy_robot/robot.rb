module ToyRobot
  class Robot
    NORTH = 'n'
    EAST  = 'e'
    SOUTH = 's'
    WEST  = 'w'

    attr_accessor :name

    def initialize(name='BB8')
      @name = name
      @position = nil
    end

    def set_position(x, y, f)
      if !x.is_a?(Integer) ||
         !y.is_a?(Integer) ||
         !(direction = identify_direction(f))
         return false
      end

      @position = {
        :x => x,
        :y => y,
        :f => direction,
      }
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
  end
end
