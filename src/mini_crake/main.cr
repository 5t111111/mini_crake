redefine_main do |main|
  {{ main }}

  begin
    MiniCrake.run
  rescue
    exit 1
  end
end
