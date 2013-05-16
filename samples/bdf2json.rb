#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'json'

# for 3x8.bdf
charcode = ''
bitmap = []
bitmap_flag = false

bitmaps = {}

ARGF.each_line { |l|
  l.chomp!
  if l =~ /\ASTARTCHAR (\w+)\z/
    charcode = $1.hex
    break if charcode > 128
  elsif l == 'BITMAP'
    bitmap_flag = true
  elsif l == 'ENDCHAR'
    bitmaps[charcode.chr]  = bitmap
    bitmap_flag = false
    bitmap = []
  elsif bitmap_flag
    bitmap << (l[0].hex / 2)
  end
}

print JSON.generate(bitmaps)
