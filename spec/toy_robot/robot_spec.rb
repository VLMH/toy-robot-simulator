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

  describe '#step_forward' do
    shared_examples 'make a step forward' do |x, y, f, expected_position|
      it 'step forward' do
        robot.set_position(x, y, f)
        expect(robot.step_forward).to eq(expected_position)
      end
    end

    context 'when position is set' do
      x = y = 0

      context 'face to north' do
        f = 'n'
        include_examples 'make a step forward', x, y, f, {x: x, y: y + 1, f: f}
      end

      context 'face to east' do
        f = 'e'
        include_examples 'make a step forward', x, y, f, {x: x + 1, y: y, f: f}
      end

      context 'face to south' do
        f = 's'
        include_examples 'make a step forward', x, y, f, {x: x, y: y - 1, f: f}
      end

      context 'face to west' do
        f = 'w'
        include_examples 'make a step forward', x, y, f, {x: x - 1, y: y, f: f}
      end
    end

    context 'when position is not set' do
      specify { expect(robot.step_forward).to be_nil }
    end
  end

  describe '#step_backward' do
    shared_examples 'make a step backward' do |x, y, f, expected_position|
      it 'step backward' do
        robot.set_position(x, y, f)
        expect(robot.step_backward).to eq(expected_position)
      end
    end

    context 'when position is set' do
      x = y = 0

      context 'face to north' do
        f = 'n'
        include_examples 'make a step backward', x, y, f, {x: x, y: y - 1, f: f}
      end

      context 'face to east' do
        f = 'e'
        include_examples 'make a step backward', x, y, f, {x: x - 1, y: y, f: f}
      end

      context 'face to south' do
        f = 's'
        include_examples 'make a step backward', x, y, f, {x: x, y: y + 1, f: f}
      end

      context 'face to west' do
        f = 'w'
        include_examples 'make a step backward', x, y, f, {x: x + 1, y: y, f: f}
      end
    end

    context 'when position is not set' do
      specify { expect(robot.step_forward).to be_nil }
    end
  end

  describe '#turn_left' do
    shared_examples 'turn left' do |x, y, f, expected_f|
      it "turn left from #{f}" do
        robot.set_position(x, y, f)
        expect(robot.turn_left[:f]).to eq(expected_f)
      end
    end

    context 'when position is set' do
      x = y = 0

      include_examples 'turn left', x, y, 'n', 'w'
      include_examples 'turn left', x, y, 'e', 'n'
      include_examples 'turn left', x, y, 's', 'e'
      include_examples 'turn left', x, y, 'w', 's'
    end

    context 'when position is not set' do
      specify { expect(robot.turn_left).to be_nil }
    end
  end

  describe '#turn_right' do
    shared_examples 'turn right' do |x, y, f, expected_f|
      it "turn right from #{f}" do
        robot.set_position(x, y, f)
        expect(robot.turn_right[:f]).to eq(expected_f)
      end
    end

    context 'when position is set' do
      x = y = 0

      include_examples 'turn right', x, y, 'n', 'e'
      include_examples 'turn right', x, y, 'e', 's'
      include_examples 'turn right', x, y, 's', 'w'
      include_examples 'turn right', x, y, 'w', 'n'
    end

    context 'when position is not set' do
      specify { expect(robot.turn_left).to be_nil }
    end
  end
end
