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
    cth.check_winner(arr, pla) ? CmdMsgs.winner(pla) : CmdMsgs.draw
  end

  def self.turns
    c = Turn.new
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    i = 0
    CmdMsgs.get_player_name
    pla = i.even? ? 'X' : 'O'
    p pla
    CmdMsgs.display arr
    checker(c, i, arr, pla)
  end

  def self.game_play
    turns
    puts 'Press any key to play, Type q to quit'
    n = gets.chomp
    quit = 'Bye bye'
    n == 'q' ? (puts quit) : game_play
  end
end

Execution.game_play
