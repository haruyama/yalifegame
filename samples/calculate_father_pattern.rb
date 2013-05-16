#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'json'
require 'yalifegame/board'

char       = ARGV[0]
generation = ARGV[1].to_i

bitmaps = {}
open(__dir__ + '/3x8.json') { |f|
  bitmaps = JSON.parse(f.read)
}

def bitmap2pattern(bitmap)
  pattern = []
  bitmap.each { |b|
    pattern << [0, b & 4, b & 2, b & 1, 0].map { |e| e == 0 ? false : true }
  }
  pattern
end

def first_ancestor(pattern, n)
  board = YALifeGame::Board.new(pattern)
  if n == 0
    return board
  else
    fps = board.father_patterns(4)
    fps.each { |fp|
      result = first_ancestor(fp, n - 1)
      return result if result
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
end

bitmap = bitmaps[char]
raise 'unknown char: ' + char unless bitmap

board = first_ancestor(bitmap2pattern(bitmap), generation)
show(board, generation) if board
