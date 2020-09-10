class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  # def recommend_exhibits(patron)
  #   patron.interests.map do |interest|
  #     interest_exhibits = []
  #     @exhibits.find_all do |exhibit|
  #       exhibit.name == interest
  #     end
  #   end.flatten
  # end
#my way ^

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end
#kats way ^

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
#my way ^

#   def patrons_by_exhibit_interest
#     result = {}
#     @exhibit.each do |exhibit|
#       @patrons.each do |patron|
#         results[exhibit] ||= []
#         results[exhibit] << patron if patron.interests.include?(exhibit.name)
#       end
#     end
#     results
#   end
#john's way ^
#
#   def patrons_by_exhibit_interest
#     @exhibits.reduce(Hash.new(Array.new)) do |results, exhibit|
#       results[exhibit] = @patrons.find_all do |patron|
#         patron.interests.include?(exhibit.name)
#       end
#       results
#     end
#   end
#hope's way ^

  def ticket_lottery_contestants(exhibit)
    patrons = patrons_by_exhibit_interest[exhibit]
    patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end 
  end

end
