require 'spec_helper'

RSpec.describe ToyRobot::Playground do
  let(:playground) { ToyRobot::Playground.new(default_size) }

  describe '#size' do
    specify { expect(playground.size).to eq(default_size) }
  end

  describe '#size=' do
    new_size = default_size + 1
    before { playground.size = new_size }
    specify { expect(playground.size).to eq(new_size) }
  end

  describe '#valid_coordinate?' do
    context 'when valid position provided' do
      [
        [0, 0],
        [1, 2],
        [default_size - 1, default_size - 1],
      ].each do |coord|
        specify { expect(playground.valid_coordinate?(coord[0], coord[1])).to be_truthy }
      end
    end

    context 'when invalid position provided' do
      [
        ['0', 0],
        [0, '0'],
        [-1, -1],
        [-1, 0],
        [0, -1],
        [default_size, default_size - 1],
        [default_size - 1, default_size],
      ].each do |coord|
        specify { expect(playground.valid_coordinate?(coord[0], coord[1])).to be_falsey }
      end
    end
  end
end
