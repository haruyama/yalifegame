# -*- encoding: utf-8 -*-
require 'test/unit'

require_relative '../../lib/yalifegame/board'

class TestSubpatterns < Test::Unit::TestCase

  def test_subpatterns_1
    board = YALifeGame::Board.new([
                                  [false, false, false],
                                  [false, true, false],
                                  [false, false, false],
    ])
    assert_equal(22, board.father_patterns.size)
  end
end
