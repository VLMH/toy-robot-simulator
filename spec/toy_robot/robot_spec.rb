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
end
