require 'spec_helper'

RSpec.describe ToyRobot::Simulator do

  let(:game) { ToyRobot::Simulator.new }

  describe '#name' do
    specify { expect(game.name).to eq(default_name) }
  end

  describe '#playground' do
    specify { expect(game.playground.size).to eq(default_size) }
  end

  describe '#playground=' do
    let(:new_size) { default_size + 1 }
    before { game.playground.size = new_size }
    specify { expect(game.playground.size).to eq(new_size) }
  end

  describe '#robot' do
    specify { expect(game.robot.name).to eq(default_robot_name) }
  end

  describe '#robot=' do
    let(:new_name) { 'new robot name' }
    before { game.robot = ToyRobot::Robot.new(game.playground, new_name) }
    specify { expect(game.robot.name).to eq(new_name) }
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

  describe '#left!' do
    shared_examples 'turn left' do |x, y, f|
      it "turn left from #{f}" do
        game.place!(x, y, f)
        expect{game.left!}.not_to raise_error
      end
    end

    context 'robot is on playground' do
      x = y = 0
      expected_position = {x: x, y: y}

      all_directions.each do |f|
        include_examples 'turn left', x, y, f
      end
    end

    context 'robot is not on playground' do
      specify { expect{game.left!}.to raise_error(RuntimeError, 'no robot on playground') }
    end
  end

  describe '#right!' do
    shared_examples 'turn right' do |x, y, f|
      it "turn right from #{f}" do
        game.place!(x, y, f)
        expect{game.right!}.not_to raise_error
      end
    end

    context 'robot is on playground' do
      x = y = 0
      expected_position = {x: x, y: y}

      all_directions.each do |f|
        include_examples 'turn right', x, y, f
      end
    end

    context 'robot is not on playground' do
      specify { expect{game.right!}.to raise_error(RuntimeError, 'no robot on playground') }
    end
  end

  describe '#report!' do
    context 'robot is on playground' do
      before { game.place!(0, 0, 'n') }
      specify { expect(game.report!).to eq({x: 0, y: 0, f: 'n'}) }
    end

    context 'robot is not on playground' do
      specify { expect{game.report!}.to raise_error(RuntimeError, 'no robot on playground') }
    end
  end
end
