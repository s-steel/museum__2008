class Museum
  attr_reader :name
  attr_accessor :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests.map do |interest|
      interest_exhibits = []
      @exhibits.find_all do |exhibit|
        exhibit.name == interest
      end
    end.flatten
  end
end
