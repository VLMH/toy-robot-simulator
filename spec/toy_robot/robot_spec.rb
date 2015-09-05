require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  let(:robot) { ToyRobot::Robot.new }
  specify { expect(robot.name).to eq(default_robot_name) }
end
