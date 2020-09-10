class Museum
  attr_reader :name
  attr_accessor :exhibits, :patrons
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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_hash = Hash.new
    @exhibits.each do |exhibit|
      patron_interest = @patrons.find_all do |patron|
        patron.interests == exhibit.name
      end
      exhibit_hash[exhibit] = patron_interest
    end
    exhibit_hash
  end
end
