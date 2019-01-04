require_relative './../lib/ttt.rb'
# Messages class
class CmdMsgs
  def self.player_name
    i = 0
    b = []
    while i < 2
      puts "Enter the player #{i + 1} name"
      a = gets.chomp
      b << a.to_s
      i += 1
    end
    display_names(b)
  end

  def self.display_names(name)
    i = 0
    while i < name.count
      puts "Player #{i + 1} name is #{name[i]}"
      i += 1
    end
  end

  def self.display(arr)
    @res = arr
    puts @grid = "
      #{@res[0]}|#{@res[1]}|#{@res[2]}
      -----
      #{@res[3]}|#{@res[4]}|#{@res[5]}
      -----
      #{@res[6]}|#{@res[7]}|#{@res[8]}"
  end

  def self.choice
    puts 'Please choose position'
    @x = gets.chomp.to_i
  end

  def self.winner(win)
    puts "#{win} wins"
  end

  def self.draw
    puts "It's draw"
  end

  def self.disposition
    puts "Don't be clever"
  end

  def self.checker(cth, ith, arr, pla)
    until cth.game_over(cth.check_draw(ith), cth.check_winner(arr, pla))
      pla = ith.even? ? 'X' : 'O'

      a = cth.add_sign(CmdMsgs.choice, pla, arr)
      unless a
        ith -= 1
        CmdMsgs.disposition
      end
      CmdMsgs.display arr
      ith += 1
    end
  end

  def self.turns
    c = Turn.new
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    i = 0
    CmdMsgs.player_name
    pla = i.even? ? 'X' : 'O'
    CmdMsgs.display arr
    CmdMsgs.checker(c, i, arr, pla)

    if c.game_over(c.check_draw(i), c.check_winner(arr, pla))
      c.check_winner(arr, pla) ? CmdMsgs.winner(pla) : CmdMsgs.draw
    end
  end

  def self.game_play
    CmdMsgs.turns
    puts 'Press any key to play, Type q to quit'
    n = gets.chomp
    quit = puts 'Bye bye'
    n == 'q' ? quit : CmdMsgs.game_play
  end
end

CmdMsgs.game_play
