require './reader'

# This class read files
class FilesReader < Reader
  private

  def battles_stats_array(array)
    name = array.partition(' ').last.partition(/( против | vs )/i).first
    text = File.read("./text/#{array}")
    finded_rapper = find_by_name(name)
    if finded_rapper.class == Hash
      finded_rapper[:text] << text
    else
      result << { name: name, text: [text] }
    end
  end

  def find_by_name(name)
    result.each do |hash|
      return hash if hash[:name].include? name
    end
  end
end
