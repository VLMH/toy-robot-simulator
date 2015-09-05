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

  describe '#move!' do
    context 'when robot position is set' do
      shared_examples 'move within range' do |x, y, f|
        it 'a step forward' do
          game.place!(x, y, f)
          expect{game.move!}.not_to raise_error
        end
      end

      shared_examples 'move out of range' do |x, y, f|
        it 'failed to move' do
          game.place!(x, y, f)
          expect{game.move!}.to raise_error(RuntimeError, 'reached boundary')
        end
      end

      context 'from bottom left most' do
        x = y = 0

        include_examples 'move within range', x, y, 'n'
        include_examples 'move within range', x, y, 'e'
        include_examples 'move out of range', x, y, 's'
        include_examples 'move out of range', x, y, 'w'
      end

      context 'from top right most' do
        x = y = default_size - 1

        include_examples 'move out of range', x, y, 'n'
        include_examples 'move out of range', x, y, 'e'
        include_examples 'move within range', x, y, 's'
        include_examples 'move within range', x, y, 'w'
      end
    end

    context 'when robot position is not set' do
      specify { expect{game.move!}.to raise_error(RuntimeError, 'no robot on playground') }
    end
  end

end
