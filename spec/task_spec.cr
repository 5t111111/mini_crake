require "./spec_helper"

describe MiniCrake::Task do
  it "should create a new instance" do
    task = MiniCrake::Task.new("name", ["deps"], ->{})
    task.should be_a MiniCrake::Task
    task.name.should eq "name"
    task.deps.should eq ["deps"]
  end

  it "should run its action" do
    task = MiniCrake::Task.new("name", ["deps"], ->{ 2 + 3 })
    task.run.should eq 5

    task = MiniCrake::Task.new("name", ["deps"], ->{ "task" })
    task.run.should eq "task"
  end
end
