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
    # @arr = [1,2,3,4,5,6,7,8,9]
    #@res = []
    # @res[x-1]='X'|| 'O'
    #     i = 0
    # while i < @arr.length
    #     if @res[i]==nil
    #         @res[i]=@arr[i]
    #         if @res[i] == 'X' || 'O'
    #             puts 'Error slot taken already'
    #         end
    #   end
    #     i +=1

    # end

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
    i = 0
    while !@result  
      if i % 2 == 0 
       a =  @p1.choice.to_i
       @arr[a-1]='X'
      
      else
       b = @p2.choice.to_i
       @arr[b-1]='O'
     
      end 
       i += 1  
       Grid.new(@arr) 
        winner @arr ,i
    end
    
   
   end
   
    def winner comb ,i
      @wins = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[2,5,8],[1,4,7],[0,3,6]]   
      
      @wins.each do |i|
        i.each do |j|
          if comb[@wins[i][j]] == 'X'
            @result = true
            return "X wins"
          elsif comb[@wins[i][j]] == 'O'
          @result = true
            return "O wins"
          else i == 9 && @result 
            @result = true
            return "Nobody wins" 
          end 
        end
      end
    end
end 

a = Game.new
b = Game.new
c = Turn.new(a,b)
