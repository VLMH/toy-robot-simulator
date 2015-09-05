module ToyRobot
  class Simulator
    attr_accessor :name

    def initialize(name='Toy Robot Simulator', size=5)
      @name = name
      @playground = ToyRobot::Playground.new(size)
      @robot = ToyRobot::Robot.new
    end

    def playground_size
      @playground.size
    end

    def place!(x, y, f)
      raise ArgumentError, 'invalid coordinate' unless @playground.valid_coordinate?(x, y)
      raise ArgumentError, 'invalid position' unless @robot.set_position(x, y, f)
    end
  end
end
