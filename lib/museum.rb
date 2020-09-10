class Museum
  attr_reader :name
  attr_accessor :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end 

end
