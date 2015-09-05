require 'spec_helper'

RSpec.describe ToyRobot::Playground do
  let(:playground) { ToyRobot::Playground.new(default_size) }

  describe '#size' do
    specify { expect(playground.size).to eq(default_size) }
  end
end
