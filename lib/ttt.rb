# Class for Acutal GamePlay
class Turn
  def add_sign(free, sign, arr)
    return arr[free - 1] = sign if check free, arr

    false
  end

  def check_winner(turn_arr, pla)
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
            [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    wins.each do |slot1, slot2, slot3|
      if turn_arr[slot1] == pla && turn_arr[slot2] == pla &&
         turn_arr[slot3] == pla
        return true
      end
    end
    false
  end

  def check_draw(act)
    return false if act < 9

    true
  end

  def game_over(first, second)
    return true if first || second

    false
  end

  def check(mate, arr)
    return true if check_position(mate) && check_space(mate, arr)

    false
  end

  def check_space(spac, arr)
    return false if arr[spac - 1] == 'X' || arr[spac - 1] == 'O'

    true
  end

  def check_position(pos)
    return false unless (1..9).cover?(pos)

    true
  end
end
