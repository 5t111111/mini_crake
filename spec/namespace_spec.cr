require "./spec_helper"

describe MiniCrake::Namespace do
  it "should create a new instance" do
    namespace = MiniCrake::Namespace.new("namespace")
    namespace.should be_a MiniCrake::Namespace
    namespace.name.should eq "namespace"
  end

  it "should manage tasks" do
    namespace = MiniCrake::Namespace.new("namespace")
    task = MiniCrake::Task.new("task", ["deps"], ->{})
    namespace.add_task task
    namespace.find_task("not found").should be_nil
    namespace.find_task("task").should be task
  end
end


