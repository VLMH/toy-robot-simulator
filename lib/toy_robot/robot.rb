module ToyRobot
  class Robot
    NORTH = 'n'
    EAST  = 'e'
    SOUTH = 's'
    WEST  = 'w'

    attr_accessor :name

    def initialize(name='BB8')
      @name = name
      @position = {:x => nil, :y => nil, :f => nil}
    end

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

    def position?
      @position[:x] && @position[:y] && @position[:f]
    end

    def position
      position? ? @position : nil
    end

    def step_forward(step=1)
      return nil unless position?
      moving(step) { |pos, step| pos + step }
      @position
    end

    def step_backward(step=1)
      return nil unless position?
      moving(step) { |pos, step| pos - step }
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

    def moving(step, &block)
      case @position[:f]
        when NORTH then @position[:y] = yield(@position[:y], step)
        when EAST  then @position[:x] = yield(@position[:x], step)
        when SOUTH then @position[:y] = yield(@position[:y], step * -1)
        when WEST  then @position[:x] = yield(@position[:x], step * -1)
      end
    end
  end
end
