# Yet Another Life Game Library

ライフゲームのライブラリです.

現在のパターンから1つ前のパターン(どこかで father pattern という語を見たのでそれを利用しています)である可能性のある集合
を計算する機能があります.

This is a yet another Life Game library.
This has a feature which calculates possible father patterns from current pattern.

# Original Code & Font

オリジナルのライフゲームのコードは http://metatoys.org/propella/lifeGame/rubyLife.rb ( Copyright (C) YAMAMIYA Takasi ) です.
山宮さんは このコードを改変したものを MIT ライセンスで配布することを快諾してくれました.
https://twitter.com/propella/status/334642064065191936 .

Original Life Game code is http://metatoys.org/propella/lifeGame/rubyLife.rb ( Copyright (C) YAMAMIYA Takasi )
Mr. YAMAMIYA allowed me to distribute my code modified from his original code
under MIT License:
https://twitter.com/propella/status/334642064065191936 .

# Dependencies

ruby 1.9.3 以降が必要です.

father patterns を計算するのは時間がかかるので, [grosser/parallel · GitHub](https://github.com/grosser/parallel) を利用して並列化できるようにしています.
ただし samples/calculate_father_pattern.rb 以外ではこの機能は利用していません.

This library uses [grosser/parallel · GitHub](https://github.com/grosser/parallel) to calculate father patterns parallelly.

後に挙げるサンプルプログラムのために
[6×8 ドット日本語フォント「k6x8」](http://www.geocities.jp/littlimi/k6x8.htm)
のデータを利用して samples/3x8.json を作成しました.

フォントのライセンスは http://www.geocities.jp/littlimi/font.htm#license にあります.

# Sample Programs

    % ruby samples/20x20.rb

20x20のライフゲームを実行します.

    % ruby samples/c.rb

5x5 で表現された c という文字から2世代前までさかのぼって見つかったパターンとそこからの変化をすべて表示します.

    % ruby samples/calculate_father_pattern.rb o 2

第1引数に文字, 第2引数に遡る世代を取ります.
3x8 の文字にマージンとして左右に 1 cell つけた 5x8 の文字パターンに対して
総当たりで世代を遡ります. 1つ条件を満たすものを見つけたら結果を表示します.
条件を満たすパターンがなければ, 結果は表示されません.
このプログラムでは 並列度を 4 にしています.

1世代遡るのにも 1分以上かかる場合があります.

    % ruby samples/calculate_father_pattern.rb  g 1
    O O       
          O   
            O 
      O O     
    O       O 
        O     
          O   
    O O       
    
              
              
        O O   
      O   O   
        O O   
          O   
      O O     
              
    ruby samples/calculate_father_pattern.rb g 1  116.41s user 3.75s system 737% cpu 16.294 total


    % ruby samples/calculate_father_pattern.rb  o 2
    O O   O O 
    O O   O O 
      O   O   
    O   O   O 
              
      O   O   
      O   O   
    O O O O O 
    
    O O   O O 
              
              
      O O O   
      O O O   
              
              
    O O   O O 
        
              
              
        O     
      O   O   
      O   O   
        O     
              
              
    ruby samples/calculate_father_pattern.rb o 2  473.04s user 13.77s system 718% cpu 1:07.77 total

# Algorithm

総当たりで試しているだけです.

* 角や縁のときにありえないパターンを除けばちょっとは速くなりそう
* 周辺の情報をつかったら枝狩りできるのだろうか? できないかな?
