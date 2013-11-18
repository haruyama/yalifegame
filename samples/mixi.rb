#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'yalifegame'

Y = 8

m_pattern = [
  [true,  true,  false, true,  false],
  [false, false, false, false, false],
  [true,  true,  false, true,  false],
  [false, false, true,  false, false],
  [false, false, false, true,  false],
  [true,  false, true,  false, true],
  [true,  false, false, false, false],
  [false, false, true,  false, true]
]

i_pattern = [
  [true,  true,  false, true,  false],
  [false, false, false, true,  false],
  [true,  true,  false, false, false],
  [false, false, false, true,  false],
  [true,  true,  false, false, false],
  [false, false, false, true,  false],
  [true,  true,  false, false, true],
  [false, false, false, false, false],
]

x_pattern = [
  [true,  true,  false, false, false],
  [false, false, false, true,  false],
  [true,  true,  false, true,  false],
  [false, false, true,  false, false],
  [false, false, true,  false, true],
  [true,  true,  false, false, true],
  [false, false, false, false, false],
  [true,  true,  false, false, true]
]

i2_pattern = [
  [true,  true,  false, true,  false],
  [false, false, false, true,  false],
  [true,  true,  false, false, false],
  [false, false, false, true,  false],
  [true,  true,  false, false, false],
  [false, false, false, true,  false],
  [true,  true,  false, false, false],
  [false, false, false, false, false]
]

pattern = [m_pattern, i_pattern, x_pattern, i2_pattern].reduce { |r, i|
  yy = 0
  while yy < r.size
    r[yy] += [false, false] + i[yy]
    yy += 1
  end
  r
}

board = YALifeGame::Board.new(YALifeGame::Board.new_pattern(0, 0))
board.pattern = pattern
board.show
print "\n----\n\n"
board.step
board.show
