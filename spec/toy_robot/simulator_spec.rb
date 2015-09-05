require 'spec_helper'

RSpec.describe ToyRobot::Simulator do

  let(:game) { ToyRobot::Simulator.new }

  describe '#name' do
    specify { expect(game.name).to eq(default_name) }
  end

  describe '#playground_size' do
    specify { expect(game.playground_size).to eq(default_size) }
  end

  describe '#place!' do
    context 'when provide valid position' do
      specify { expect{game.place!(0, 0, 'n')}.not_to raise_error }
    end

    context 'when provide invalid coordinate' do
      specify { expect{game.place!(-1, 0, 'n')}.to raise_error(ArgumentError, 'invalid coordinate') }
    end

    context 'when provide invalid position' do
      specify { expect{game.place!(0, 0, 'x')}.to raise_error(ArgumentError, 'invalid position') }
    end
  end

end
