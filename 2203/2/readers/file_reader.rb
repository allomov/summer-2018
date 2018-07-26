class FileReader
  def initialize(file_paths)
  	@file_paths = file_paths
  end

  def read
    file_paths.each do |file_path|
      # require 'pry'; binding.pry
      filename = File.filename(file_path)
      name1, name2 = filename.split(" vs ")
      rapper1 = registry.find_or_create_by_name(name1)
      rapper2 = registry.find_or_create_by_name(name1)
      battle = read_battle_from_file(file_path)
      rapper1.add_battle(battle)
      rapper2.add_battle(battle)
    end
  end

  def read_battle_from_file(path)
  	content = File.open(path).read
  	Battle.new(content)
  end

  private

  def registry
  	RapperRegistry.instance
  end
end