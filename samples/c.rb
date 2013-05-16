#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'yalifegame'

pattern = [
  [false, false, false, false, false],
  [false, false, true, true, false],
  [false, true, false, false, false],
  [false, true, false, false, false],
  [false, false, true, true, false]
]

board = YALifeGame::Board.new(pattern)
fps = board.father_patterns
p fps.size
fps.each { |fp|
  board2 = YALifeGame::Board.new(fp)
  fps2 = board2.father_patterns
  p fps2.size
  fps2.each { |fp2|
    board = YALifeGame::Board.new(fp2)
    board.show
    print "\n"
    board.step
    board.show
    print "\n"
    board.step
    board.show
    print "\n"
    print "\n"
    print "\n"
  }
}
