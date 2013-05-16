#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'yalifegame'
require 'continuation'

pattern = [
  [false, false, false, false, false, false],
  [false, false, true, true, false, false],
  [false, true, false, false, false, false],
  [false, true, false, false, false, false],
  [false, false, true, true, false, false],
]

def first_ancestor(pattern, n)
  board = YALifeGame::Board.new(pattern)
  if n == 0
    return board
  else
    fps = board.father_patterns
    fps.each { |fp|
      return first_ancestor(fp, n - 1)
    }
  end
  return nil
end

def show(board, n)
  board.show
  n.times {
    print "\n"
    board.step
    board.show
  }
  print "\n"
end

n = 2
board = first_ancestor(pattern, n)
show(board, n) if board
