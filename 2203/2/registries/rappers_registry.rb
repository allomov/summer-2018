# Registry.instance.find_or_create_by_name()

# RapperRegistry.instance

class RapperRegistry

  def self.instance # singleton pattern
    @_instance ||= new
  end

  def initialize()
    @rappers = []
  end

  def find_or_create_by_name(name)
    find_by_name(name) || @rappers << Rapper.new(name)
  end

  def find_by_name(name)
    @rappers.find { |r| r.name == name }
  end
end
