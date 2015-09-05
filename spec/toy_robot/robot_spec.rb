require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  let(:robot) { ToyRobot::Robot.new }

  describe '#name' do
    specify { expect(robot.name).to eq(default_robot_name) }
  end

  describe '#set_position' do
    specify { expect(robot.set_position(0, 0, 'n')).to be_truthy }

    context 'when invalid position' do
      specify { expect(robot.set_position('a', 0, 'n')).to be_falsey }
      specify { expect(robot.set_position(0, 'b', 'n')).to be_falsey }
      specify { expect(robot.set_position(0, 0, 'x')).to be_falsey }
    end
  end

  describe '#position?' do
    context 'when position is set' do
      it 'return true' do
        robot.set_position(0, 0, 'n')
        expect(robot.position?).to be_truthy
      end
    end

    context 'when position is not set' do
      specify { expect(robot.position?).to be_falsey }
    end
  end

  describe '#position' do
    context 'when position is set' do
      x = y = 0
      f = 'n'
      position = {x: x, y: y, f: 'n'}

      before { robot.set_position(x, y, f) }

      specify { expect(robot.position).to eq(position) }
    end

    context 'when position is not set' do
      specify { expect(robot.position).to be_nil }
    end
  end
end
