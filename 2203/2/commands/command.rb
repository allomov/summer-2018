class NotImplemented < StandardError; end

class Executor
  attr_accessor :reader, :writer
  def initialize(reader, writer)
    @reader, @writer = reader, writer
  end

  def run!
    reader.read
    execute
    writer.write
  end

  def execute
    raise NotImplemented
  end
end