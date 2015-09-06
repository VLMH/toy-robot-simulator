module ToyRobot
  # Playground of the game that robot moves on it
  class Playground
    attr_accessor :size

    # Init playground with size provided
    def initialize(size)
      @size = size
    end

    # Verify coordinate according to size
    #
    # Params:
    # - +x+ X-coordinate
    # - +y+ Y-coordinate
    def valid_coordinate?(x, y)
      return false if !x.is_a?(Integer) || !y.is_a?(Integer) # invalid type
      return false if x < 0 || y < 0 || x > max_index || y > max_index # range
      true
    end

    private

    def max_index
      @size - 1
    end
  end
end
