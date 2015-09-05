require 'spec_helper'

RSpec.describe ToyRobot::Playground do
  let(:default_size) {5}
  let(:playground) { ToyRobot::Playground.new(default_size) }

  specify { expect(playground.size).to eq(default_size) }
end
