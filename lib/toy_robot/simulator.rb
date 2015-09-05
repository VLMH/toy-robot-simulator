module ToyRobot
  class Simulator
    attr_accessor :name

    def initialize(name='Toy Robot Simulator', size=5)
      @name = name
      @playground = ToyRobot::Playground.new(size)
    end

    def playground_size
      @playground.size
    end
  end
end
