# -*- encoding: utf-8 -*-
require 'test/unit'

require_relative '../../lib/yalifegame/board'

class TestHeight < Test::Unit::TestCase

  def test_height_1

    board = YALifeGame::Board.new(YALifeGame::Board.new_pattern(3, 3))
    assert_equal(3, board.height)
    board = YALifeGame::Board.new(YALifeGame::Board.new_pattern(5, 4))
    assert_equal(4, board.height)

  end

end
