# CommandFactory.build(:curse_words_command)
class WriterFactory
  def self.build(type, *args)
    case type
    when :terminal
      return TerminalTableWriter.new(*args)
    when :html
      return HtmlTableWriter.new(*args)
    else
      raise NotImplemented
    end
  end
end