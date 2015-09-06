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

    def move!
      unless new_position = @robot.step_forward
        raise RuntimeError, 'no robot on playground'
      end

      unless @playground.valid_coordinate?(new_position[:x], new_position[:y])
        @robot.step_backward # rollback
        raise RuntimeError, 'reached boundary'
      end
    end

    def left!
      raise RuntimeError, 'no robot on playground' unless @robot.turn_left
    end

    def right!
      raise RuntimeError, 'no robot on playground' unless @robot.turn_right
    end

    def report!
      raise RuntimeError, 'no robot on playground' unless position = @robot.position
      position
    end
  end
end
