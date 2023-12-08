module Car
  def go
    puts "Go..."
  end
end

class Mercedes
  include Car
end

class Toyota
  include Car
end

mers = Mercedes.new
mers.go

toyota = Toyota.new
toyota.go
