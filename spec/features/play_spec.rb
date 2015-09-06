require 'spec_helper'

RSpec.describe 'play with commands', type: :feature do

  let(:game) { ToyRobot::Simulator.new }

  it 'sample 1 - a move' do
    game.place! 0, 0, 'NORTH'
    game.move!
    expect(game.report!).to eq({x: 0, y: 1, f: 'n'})
  end

  it 'sample 2 - a turn' do
    game.place! 0, 0, 'NORTH'
    game.left!
    expect(game.report!).to eq({x: 0, y: 0, f: 'w'})
  end

  it 'sample 3 - couple actions' do
    game.place! 1, 2, 'EAST'
    game.move!
    game.move!
    game.left!
    game.move!
    expect(game.report!).to eq({x: 3, y: 3, f: 'n'})
  end

end
