require 'spec_helper'

RSpec.describe ToyRobot::Simulator do

  let(:game) { ToyRobot::Simulator.new }

  specify { expect(game.name).to eq(default_name) }
  specify { expect(game.playground_size).to eq(default_size) }

end
