class MiniCrake::Manager
  getter namespaces : Hash(String, Namespace)
  getter tasks : Hash(String, Task)

  def initialize
    @namespaces = {} of String => Namespace
    @tasks = {} of String => Task
  end

  def add_namespace(namespace)
    @namespaces[namespace.name] = namespace
  end

  def add_task(task)
    @tasks[task.name] = task
  end

  def find_namespace(name)
    @namespaces[name]?
  end

  def find_task(name)
    @tasks[name]?
  end

  def namespace(name, &block)
    Namespace.new(name).tap do |namespace|
      with namespace yield namespace
      add_namespace(namespace)
    end
  end

  def task(name, deps, &block)
    Task.new(name, deps, block).tap do |task|
      add_task(task)
    end
  end

  def run(target)
    namespace, task = target.split(":")

    if namespace
      return false unless ns = find_namespace(namespace)
      return false unless task = ns.find_task(task)
    else
      return false unless task = find_task(task)
    end
    task.run
  end
end
