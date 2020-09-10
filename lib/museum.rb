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
      patrons_array = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          patrons_array << patron

        end
      end
      exhibit_hash[exhibit] = patrons_array
    end
    exhibit_hash
  end
end
