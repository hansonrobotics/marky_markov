class MarkovDictionary
  def initialize(file)
    @filename = file
    @dictionary = {}
    self.parse_file
  end

  def dictionary
    @dictionary
  end

  def open_file(file)
    File.open(file, "r").read.split
  end

  def add_word(rootword, followedby)
    @dictionary[rootword] ||= Hash.new(0)
    @dictionary[rootword][followedby] += 1
  end

  def parse_file()
    # Special case for last word in source file as it has no words following it.
    @contents = open_file(@filename)
    (@contents.length-1).times do |i|
      self.add_word(@contents[i], @contents[i+1])
    end
    @dictionary[(@contents.last)] ||= Hash.new(0)
  end
end
