require_relative './../lib/ttt.rb'
# Messages class
class CmdMsgs
  def self.get_player_name
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
end
