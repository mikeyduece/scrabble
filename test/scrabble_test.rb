gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_can_score_a_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
  end

  def test_it_scores_empty_string_as_zero
    game = Scrabble.new
    assert_equal 0, game.score("")
  end

  def test_it_returns_zero_if_given_nil
    game = Scrabble.new
    assert_equal 0, game.score(nil)
  end

  def test_it_can_score_with_multipliers
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end
end
# > game.score_with_multipliers('hello', [1,2,1,1,1])
# => 9
# > game.score_with_multipliers('hello', [1,2,1,1,1], 2)
# => 18
# > game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
# => 58
# ```
