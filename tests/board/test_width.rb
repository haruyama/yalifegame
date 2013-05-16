# -*- encoding: utf-8 -*-
require 'test/unit'

require_relative '../../lib/yalifegame/board'

class TestWidth < Test::Unit::TestCase

  def test_width_1

    board = YALifeGame::Board.new(YALifeGame::Board.new_pattern(3, 3))
    assert_equal(3, board.width)
    board = YALifeGame::Board.new(YALifeGame::Board.new_pattern(5, 3))
    assert_equal(5, board.width)

  end

end
