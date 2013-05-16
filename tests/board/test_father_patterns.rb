# -*- encoding: utf-8 -*-
require 'test/unit'

require_relative '../../lib/yalifegame/board'

class TestFatherPatterns < Test::Unit::TestCase

  def test_father_patterns_1

    board = YALifeGame::Board.new(YALifeGame::Board.new_pattern(3, 3))
    assert_equal(140, board.live_subpatterns.size)
    assert_equal(372, board.dead_subpatterns.size)

  end

end

