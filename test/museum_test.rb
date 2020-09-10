require './lib/patron'
require './lib/exhibit'
require './lib/museum'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class MuseumTest < Minitest::Test

  def test_it_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
  end
end
