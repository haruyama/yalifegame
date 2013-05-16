#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'yalifegame'

board = YALifeGame::Board.new(YALifeGame::Board.new_pattern(20, 20))
loop do
  board.random
  (1 .. 50).each do
    board.step
    board.clear_and_show
    sleep 0.2
  end
end
