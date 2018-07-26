require 'optparse'
require 'terminal-table'
require './files_reader'
require './author_reader'
require './russian_declensions.rb'

OptionParser.new do |options|
  options.on('--top-bad-words=') do |number|
    path = Dir.entries('text/').reject { |file_path| file_path =~ /^\.+/i }
    authors = AuthorReader.new(FilesReader.new(path).read).read
    authors.sort_by! { |author| -author.bad_words }
    rows = authors.map do |author|
      [
        author.name,
        "#{author.battles_count} #{RussianDeclensions.battles_count_for_raper(author.battles_count)}",
        "#{author.bad_words} #{RussianDeclensions.bad_words(author.bad_words)}",
        "#{author.bad_words_per_battle} #{RussianDeclensions.word(author.bad_words_per_battle)} на баттл",
        "#{author.words_per_round} #{RussianDeclensions.word(author.words_per_round)} в раунде"
      ]
    end
    table = Terminal::Table.new rows: rows[0...number.to_i]
    puts table
  end
end.parse!
