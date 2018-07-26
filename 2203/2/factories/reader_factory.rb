class ReaderFactory
  def self.build(type, *args)
    case type
    when :files
      return FileReader.new(*args)
    when :youtube
      return YoutubeReader.new(*args)
    else
      raise NotImplemented
    end
  end
end