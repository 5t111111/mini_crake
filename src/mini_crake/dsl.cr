module MiniCrake::DSL
  extend self

  MANAGER = Manager.new

  def task(name, deps = [] of String, &block)
    MANAGER.task(name, deps, &block)
  end

  def namespace(name, &block)
    MANAGER.namespace(name) do |namespace|
      with namespace yield namespace
    end
  end
end
