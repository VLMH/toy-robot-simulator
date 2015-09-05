module ToyRobot
  class Robot
    attr_accessor :name

    def initialize(name='BB8')
      @name = name
      @position = nil
    end

    def set_position(x, y, f)
      @position = {
        :x => x,
        :y => y,
        :f => f,
      }
    end
  end
end
