class Museum
  attr_reader :name,
              :exhibits,
              :patrons,
              :revenue,
              :patrons_of_exhibits
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
    @patrons_of_exhibits = Hash.new{ |h,k| h[k] = []}

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

    ordered_exhibits = @exhibits.sort_by do |exhibit|
      exhibit.cost
    end.reverse

    ordered_exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name) && patron.spending_money >= exhibit.cost
        patron.spending_money -= exhibit.cost
        @revenue += exhibit.cost
        @patrons_of_exhibits[exhibit] << patron
      end
    end
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

    # @patrons.find_all do |patron|
    #   patron.interests.include?(exhibit.name) &&
    #   patron.spending_money < exhibit.cost
    # end
# hope's way ^

  def draw_lottery_winner(exhibit)
    winner = ticket_lottery_contestants(exhibit).sample
    winner.name if !winner.nil?
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    if winner
      "#{winner} has won the #{exhibit.name} exhibit lottery"
    else
      "No winners for this lottery"
    end
  end

end
