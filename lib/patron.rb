class Patron
  attr_reader :name, :spending_money
  attr_accessor :interests
  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
  end

end
