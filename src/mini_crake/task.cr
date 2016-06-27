class MiniCrake::Task
  getter name : String
  getter deps : Array(String)
  getter action : Proc(Void)

  def initialize(@name, @deps, @action)
  end

  def run
    @action.call
  end
end
