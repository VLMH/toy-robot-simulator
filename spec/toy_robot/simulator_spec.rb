require 'spec_helper'

RSpec.describe 'ToyRobot::Simulator' do

  let(:game) { ToyRobot::Simulator.new }

  specify { expect(game.name).eq('Toy Robot Simulator') }

end
