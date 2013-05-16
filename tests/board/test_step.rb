# -*- encoding: utf-8 -*-
require 'test/unit'

require_relative '../../lib/yalifegame/board'

class TestStep < Test::Unit::TestCase

  def test_step_1

    board = YALifeGame::Board.new([
                                  [false, false, true],
                                  [false, false, true],
                                  [false, true, false],
    ])

    assert_equal([
                 [false, false, false],
                 [false, true, true],
                 [false, false, false],
    ], board.step)

    assert_equal([
                 [false, false, false],
                 [false, true, true],
                 [false, false, false],
    ], board.pattern)

    assert_equal([
                 [false, false, true],
                 [false, false, true],
                 [false, true, false],
    ], board.father_pattern)
  end

end

