require 'spec_helper'

RSpec.describe ToyRobot::Playground do
  let(:playground) { ToyRobot::Playground.new(default_size) }

  describe '#size' do
    specify { expect(playground.size).to eq(default_size) }
  end

  describe '#valid_coordinate?' do
    context 'when valid position provided' do
      specify { expect(playground.valid_coordinate?(0, 0)).to be_truthy }
      specify { expect(playground.valid_coordinate?(1, 2)).to be_truthy }
      specify { expect(playground.valid_coordinate?(default_size - 1, default_size - 1)).to be_truthy }
    end

    context 'when invalid position provided' do
      specify { expect(playground.valid_coordinate?('0', 0)).to be_falsey }
      specify { expect(playground.valid_coordinate?(0, '0')).to be_falsey }
      specify { expect(playground.valid_coordinate?(-1, -1)).to be_falsey }
      specify { expect(playground.valid_coordinate?(-1, 0)).to be_falsey }
      specify { expect(playground.valid_coordinate?(0, -1)).to be_falsey }
      specify { expect(playground.valid_coordinate?(default_size, default_size - 1)).to be_falsey }
      specify { expect(playground.valid_coordinate?(default_size - 1, default_size)).to be_falsey }
    end
  end
end
