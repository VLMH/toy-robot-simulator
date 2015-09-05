require 'spec_helper'

RSpec.describe ToyRobot::Simulator do

  let(:game) { ToyRobot::Simulator.new }

  describe '#name' do
    specify { expect(game.name).to eq(default_name) }
  end

  describe '#playground_size' do
    specify { expect(game.playground_size).to eq(default_size) }
  end

end
