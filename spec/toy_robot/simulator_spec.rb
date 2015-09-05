require 'spec_helper'

RSpec.describe 'ToyRobot::Simulator' do

  let(:game) { ToyRobot::Simulator.new }

  specify { expect(game.name).to eq('Toy Robot Simulator') }

end
