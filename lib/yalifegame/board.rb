# -*- encoding: utf-8 -*-

# original: http://metatoys.org/propella/lifeGame/rubyLife.rb Copyright (C) YAMAMIYA Takasi
# modified by HARUYAMA Seigo.

require 'parallel'

module YALifeGame
  class Board

    attr_accessor :pattern, :father_pattern

    def initialize(pattern)
      @father_pattern = nil
      @pattern        = pattern
    end

    def width
      @pattern.size
    end

    def height
      @pattern[0].size
    end

    CLEAR = "\33c"
    def clear_and_show
      print CLEAR
      show
    end

    def show
      (0 ... width).each { |x|
        (0 ... height).each { |y|
          print @pattern[x][y] ? 'O ' : '  '
        }
        print "\n"
      }
    end

    def step
      new_pattern = Board.new_pattern(width, height)
      (0 ... width).each do |x|
        (0 ... height).each do |y|
          new_pattern[x][y] = transition(@pattern[x][y], count_lives_around_cell(x, y))
        end
      end
      @father_pattern = @pattern
      @pattern        = new_pattern
    end

    def self.new_pattern(x, y)
      pattern = Array.new(x)
      pattern.map! do |row|
        Array.new(y)
      end
      pattern
    end

    def random
      (0 ... width).each { |x|
        (0 ... height).each { |y|
          @pattern[x][y] = rand < 0.5 ? true : false
        }
      }
    end

    def live_subpatterns
      calc_subpatterns unless @live_subpatterns
      @live_subpatterns
    end

    def dead_subpatterns
      calc_subpatterns unless @dead_subpatterns
      @dead_subpatterns
    end

    def father_patterns(in_process = 1)
      candidates = [Board.new_pattern(width, height)]
      catch :loop do
        (0...width).each { |x|
          (0...height).each { |y|
            if @pattern[x][y]
              subpatterns = live_subpatterns
            else
              subpatterns = dead_subpatterns
            end
            candidates =
              Parallel.map(candidates, inprocess: in_process) { |c|
              new_candidates = []
              subpatterns.each { |sp|
                nc = []
                (0...c.size).each { |i|
                  nc[i] = c[i].clone
                }
                catch :match_loop do
                  (0..2).each { |px|
                    cx = x + px - 1
                    (0..2).each { |py|
                      cy = y + py - 1
                      if (0...width).include?(cx) && (0...height).include?(cy)
                        if nc[cx][cy].nil?
                          nc[cx][cy] = sp[px][py]
                        elsif nc[cx][cy] == sp[px][py]
                        else
                          throw :match_loop
                        end
                      else
                        throw :match_loop if sp[px][py]
                      end
                    }
                  }
                  new_candidates << nc
                end
              }
              new_candidates
            }.flatten(1)
            throw :loop if candidates.empty?
          }
        }
      end
      candidates
    end

    private
    def count_lives_around_cell(x, y)
      [
        [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
        [x    , y - 1],             [x    , y + 1],
        [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]
      ].select { |px, py|
        (0...width).include?(px) && (0...height).include?(py) && @pattern[px][py]
      }.count
    end

    def transition(cell, num)
      if cell
        return ([false, false, true, true, false, false, false, false, false, false, false, false][num])
      else
        return ([false, false, false, true, false, false, false, false, false, false, false, false][num])
      end
    end

    def calc_subpatterns
      @live_subpatterns = []
      @dead_subpatterns = []

      [true, false].repeated_permutation(9).to_a.map { |e|
        [e[0, 3], e[3, 3], e[6, 3]]
      }.each { |a|
        board = Board.new(a)
        board.step

        if board.pattern[1][1]
          @live_subpatterns << board.father_pattern
        else
          @dead_subpatterns << board.father_pattern
        end
      }
    end
  end
end
