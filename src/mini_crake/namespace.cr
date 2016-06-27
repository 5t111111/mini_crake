class MiniCrake::Namespace
  getter name : String
  getter tasks

  def initialize(@name)
    @tasks = {} of String => Task
  end

  def add_task(task)
    @tasks[task.name] = task
  end

  def find_task(name)
    @tasks[name]?
  end

  def task(name, deps = [] of String, &block)
    Task.new(name, deps, block).tap do |task|
      add_task(task)
    end
  end
end
