# -*- encoding: utf-8 -*-
require 'test/unit'

require_relative '../../lib/yalifegame/board'

class TestNewPattern < Test::Unit::TestCase

  def test_new_pattern_1

    assert_equal([[nil].cycle(3).to_a].cycle(3).to_a,
                 YALifeGame::Board.new_pattern(3, 3))

  end

end

