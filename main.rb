

#player1 player2
# players are choosing symbols
#display grid
#each player fills empty space in grid
#each player has one turn
#input while or until
#input check for the state finished
#compare result
# if -1 first wins 0 draws else second wins
#display result

class Players
  def get_name
    puts "Write Player1 name"
    @player1 = gets.chomp
    puts "Write Player2 name"
    @player2 = gets.chomp
  end

  def display_name
    puts "#{@player1} is player1 and #{@player2} is player2"
  end
end

class Grid
  def initialize
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def set_grid(i)
    @arr[i] = "X"

    #check the count of X
    # if X is bigger
    # add O
  end

  def display_grid
    @grid = "
        #{@arr[0]}|#{@arr[1]}|#{@arr[2]}
        -----
        #{@arr[3]}|#{@arr[4]}|#{@arr[5]}
        -----
        #{@arr[6]}|#{@arr[7]}|#{@arr[8]}
        "
  end
end

a = Players.new
# a.get_name
# a.display_name
# Players, Board, Check Result,

b = Grid.new

b.set_grid(1)
b.set_grid(7)
puts b.display_grid
