require_relative './../lib/ttt.rb'
require_relative './cmd_msgs.rb'
# game running class
class Execution
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
    checker(c, i, arr, pla)

    if c.game_over(c.check_draw(i), c.check_winner(arr, pla))
      c.check_winner(arr, pla) ? CmdMsgs.winner(pla) : CmdMsgs.draw
    end
  end

  def self.game_play
    turns
    puts 'Press any key to play, Type q to quit'
    n = gets.chomp
    quit = puts 'Bye bye'
    n == 'q' ? quit : game_play
  end
end

Execution.game_play
