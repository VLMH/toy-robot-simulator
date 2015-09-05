module ToyRobot
  class Playground
    attr_reader :size

    def initialize(size)
      @size = size
    end

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
