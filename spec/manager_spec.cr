require "./spec_helper"

describe MiniCrake::Manager do
  it "should create a new instance" do
    manager = MiniCrake::Manager.new
    manager.should be_a MiniCrake::Manager
  end

  it "should manage namespaces" do
    manager = MiniCrake::Manager.new
    namespace = MiniCrake::Namespace.new("namespace")
    manager.add_namespace(namespace)
    manager.find_namespace("not found").should be_nil
    manager.find_namespace("namespace").should be namespace
  end

  it "should manage tasks" do
    manager = MiniCrake::Manager.new
    task = MiniCrake::Task.new("task", ["deps"], ->{})
    manager.add_task(task)
    manager.find_task("not found").should be_nil
    manager.find_task("task").should be task
  end

  it "should add a task and return it" do
    manager = MiniCrake::Manager.new
    task = manager.task("task", ["deps"]) { }
    manager.find_task("task").should be task
  end
end
