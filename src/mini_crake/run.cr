require "option_parser"

module MiniCrake
  def self.run(args = ARGV.dup)
    DSL::MANAGER.run(args[0])
  end
end
