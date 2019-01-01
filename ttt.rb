class Player
  attr_accessor :name

  def initialize(a)
    @name = a
  end

  def choice
    puts "Please choose position"
    @x = gets.chomp
  end
end

class Game
  def start
    puts "Enter player name"
    a = gets.chomp
    Player.new(a)
  end
end

class Grid
  def initialize(arr)
    @res = arr
    display
  end

  def display
    puts @grid = "
        #{@res[0]}|#{@res[1]}|#{@res[2]}
        -----
        #{@res[3]}|#{@res[4]}|#{@res[5]}
        -----
        #{@res[6]}|#{@res[7]}|#{@res[8]}
        "
  end
end

class Turn
  def initialize(p1, p2)
    @p1 = p1.start
    @p2 = p2.start
    puts "Player1 is #{@p1.name}"
    puts "Player2 is #{@p2.name}"
    turns
  end

  def turns
    @result = false
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @i = 0
    while !@result
      Grid.new(@arr)
      if @i % 2 == 0
        a = @p1.choice.to_i
        if check a
          @arr[a - 1] = "X"
        end
      else
        b = @p2.choice.to_i
        if check b
          @arr[b - 1] = "O"
        end
      end
      @i += 1
      winner @arr, @i
    end
  end

  def winner(comb, c)
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    i = 0
    while i < wins.length && @result == false
      j = 0
      while j < wins[i].length && @result == false
        if comb[wins[i][j]] == "X" && comb[wins[i][j + 1]] == "X" && comb[wins[i][j + 2]] == "X"
          @result = true
          puts "X wins"
        elsif comb[wins[i][j]] == "O" && comb[wins[i][j + 1]] == "O" && comb[wins[i][j + 2]] == "O"
          @result = true
          puts "O wins"
        elsif c == 9 && !@result
          @result = true
          puts "Nobody wins"
        else
          break
        end
        j += 1
      end
      i += 1
    end
  end

  def check(mate)
    if !(1..9).include?(mate)
      puts "Don't be clever!!!"
      @i -= 1
    end
    if @arr[mate - 1] == "X" || @arr[mate - 1] == "O"
      puts "Just don't try it"
      @i -= 1
      return false
    end
    true
  end
end
