require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  let(:robot) { ToyRobot::Robot.new }

  describe '#name' do
    specify { expect(robot.name).to eq(default_robot_name) }
  end

  describe '#set_position' do
    specify { expect(robot.set_position(0, 0, 'n')).to be_truthy }
  end
end
