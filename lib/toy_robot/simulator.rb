module ToyRobot

  # This is the main class developer used to control the game
  class Simulator
    attr_accessor :name

    # Init a game
    #
    # Params:
    # - +name+ Name of the game
    # - +size+ Size of the playground. [default: 5 x 5]
    def initialize(name='Toy Robot Simulator', size=5)
      @name = name
      @playground = ToyRobot::Playground.new(size)
      @robot = ToyRobot::Robot.new
    end

    # Get size of playground
    def playground_size
      @playground.size
    end

    # Set size of playground
    def set_playground_size(size)
      @playground.size = size
    end

    # Place a robot on playground
    #
    # Params:
    # - +x+ X-coordinate
    # - +y+ Y-coordinate
    # - +f+ Direction ['north', 'east', 'south', 'west']
    def place!(x, y, f)
      raise ArgumentError, 'invalid coordinate' unless @playground.valid_coordinate?(x, y)
      raise ArgumentError, 'invalid position' unless @robot.set_position(x, y, f)
    end

    # Move one step forward
    # Raise RuntimeError on failed
    def move!
      unless new_position = @robot.step_forward
        raise RuntimeError, 'no robot on playground'
      end

      unless @playground.valid_coordinate?(new_position[:x], new_position[:y])
        @robot.step_backward # rollback
        raise RuntimeError, 'reached boundary'
      end
    end

    # Turn left
    # Raise RuntimeError if no robot on playground
    def left!
      raise RuntimeError, 'no robot on playground' unless @robot.turn_left
    end

    # Turn right
    # Raise RuntimeError if no robot on playground
    def right!
      raise RuntimeError, 'no robot on playground' unless @robot.turn_right
    end

    # Get position of robot
    # Raise RuntimeError if no robot on playground
    def report!
      raise RuntimeError, 'no robot on playground' unless position = @robot.position
      position
    end
  end
end
