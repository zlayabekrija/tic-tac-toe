require_relative './bin/cmd_msgs.rb'
# Class for Acutal GamePlay
class Turn
  CmdMsgs.player_name
  def turns
    @result = false
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @i = 0
    until @result
      CmdMsgs.display @arr
      add_sign
      @i += 1
      check_winner @arr, @i
    end
  end

  def add_sign
    if @i.even?
      a = CmdMsgs.choice.to_i
      @arr[a - 1] = 'X' if check a
    else
      b = CmdMsgs.choice.to_i
      @arr[b - 1] = 'O' if check b
    end
  end

  def check_winner(turn_arr, count_turns)
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
            [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    pla = count_turns.even? ? 'X' : 'O'
    i = 0
    while i < wins.length && !@result
      j = 0
      while j < wins[i].length && !@result
        if turn_arr[wins[i][j]] == pla && turn_arr[wins[i][j + 1]] == pla &&
           turn_arr[wins[i][j + 2]] == pla
         @result = true
          CmdMsgs.winner(pla)
        elsif count_turns == 9 && !@result
          @result = true
          puts 'Nobody wins'
        else
          break
        end
        j += 1
      end
      i += 1
    end
  end

  def check(mate)
    return true if check_position(mate) && check_space(mate)

    false
  end

  def check_space(spac)
    if @arr[spac - 1] == 'X' || @arr[spac - 1] == 'O'
      puts "Just don't try it"
      @i -= 1
      return false
    end
    true
  end

  def check_position(pos)
    unless (1..9).cover?(pos)
      puts "Don't be clever!!!"
      @i -= 1
      return false
    end
    true
  end
end

def game_play
  c = Turn.new
  c.turns
  puts 'Game over'
  puts 'Type yes to play another game'
  n = gets.chomp
  n == 'yes' ? c.turns : 'Bye bye'
end

game_play
