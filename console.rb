require_relative "players.rb"
require_relative "board.rb"
class Console
  
  attr_accessor :board, :player1, :player2, :marker, :current_player, :showboard, :size

  def  initialize() 
    @board = Board.new 
    @player1 
    @player2 = setup_players
    @current_player
    @inactive_player
    @multiplier =  Math.sqrt(board.board.size).to_i
   
  puts "Size in init.console. #{board.board.size}>>>>>>>SIZE"
  puts "Size in init.console. #{@size}>>>>>>>SIZE"
  puts "MULTIPLIER is #{Math.sqrt(board.board.size).to_i}"
  puts "<<<Boardmethods>>>>#{board.class} ><<<<<<board in console<<<"

  end  
  def setup_players()
        p "   How Many Hoomans?:..1, 2 or 0  "
    hooms = gets.chomp.to_s
      if hooms == "1"  
        @player1 = Playerhuman.new("x")
            p  "  Choose Difficulty Level::"
            p  "  1=(easy), 2=(DeePBluE) or 3=(Garry Kasparov)"

        pl2ai = gets.chomp.to_s
          if pl2ai == "1"
              @player2 = Playerseq.new("o") 
          elsif pl2ai == "2"
              @player2 = Playerrand.new("o")
          elsif pl2ai == "3" 
            # puts " /board is //#{Board.board} and its class is #{Board.board.class}"
            # p "board in playerunbeet setup init #{@board.class} "
            puts "Size in player setup>>> #{board.board.size}<<<<<<<"
            puts "Size2 in player setup>>> #{board.board.size}<<<<<<<"
              @player2 = Playerunbeets.new("o") 
          else
          p       "Does Not Compute" 
          end  
      elsif hooms == "2"
          @player1 = Playerhuman.new("x") 
          @player2 = Playerhuman.new("o")
      elsif hooms == "0"
            p "   Which AIs Would you like pit against one another?"
            p "   1 =(Ran_v_Ran), 2 =(Seq_v_Seq), 3 =(Ran_v_Seq), 4 =(Garry_v_Ran), 5 =(Garry_v_Seq), 6 =(Garry_v_Garry) "
            p 
        ai_v_ai = gets.chomp.to_s
            if ai_v_ai == "1"
              @player1 = Playerrand.new("x") 
              @player2 = Playerrand.new("o") 
            elsif ai_v_ai == "2"  
              @player1 = Playerseq.new("x") 
              @player2 = Playerseq.new("o")
            elsif ai_v_ai == "3"   
              @player1 = Playerrand.new("x") 
              @player2 = Playerseq.new("o") 
            elsif ai_v_ai == "4"   
              @player1 = Playerrand.new("x") 
              @player2 = Playerunbeets.new("o") 
            elsif ai_v_ai == "5"   
              @player1 = Playerunbeets.new("x") 
              @player2 = Playerseq.new("o") 
            elsif ai_v_ai == "6"   
              @player1 = Playerunbeets.new("x") 
              @player2 = Playerunbeets.new("o") 
            else
              p       "Does Not Compute!!"         
            end
        # else
        #   p       "Does Not Compute"  
        # end   
    end 
    @current_player = player1
    @inactive_player = player2  
  end  
  
  def print_board()
    p "                                                                   "
    p "       VVVVVVVVVVVVVVVVVVVV~^0v0^~VVVVVVVVVVVVVVVVVVVVVV           "
    p "                      OK #{@current_player.marker} it's your turn       "
    p "             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^            "
    p "             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^            "
    board.board.each_slice(@multiplier) do |row|
      p row
    end  
    
    p "IN PRINTBOARD... #{@board.board}<<board #{@choice}<<choice #{@current_player.marker}<<marker<<<
    <board,choice,playermarker>>"
    
    
    # p @board
    
  end
  
  def showbup(board, choice, marker)
    disp_board = [*1..board.board.size]
    choice = choice.to_i
    p " <<<CHOICE IN SHOWBUP#{choice}<<<<<<<<<<"
    disp_board[choice - 1] = marker
    print_board()
  end
  
  def get_move() 
    p "IN GETMOVE... #{@board}DISPBOARD  #{@current_player.marker}PLAYERMARKER<<board,choice,playermarker>>"
    @current_player.move(@board.board, @size)
  end
  
  def checkval(choice)
    if  @board.val_spot(@board.board, choice) == true
      @board.place_marker(@current_player.marker, choice)
      p "IN CHECKVAL... #{@board} #{choice} #{@current_player.marker}<<board,choice,playermarker>>"
      showbup(@board, choice, @current_player.marker)
    else 
      p "Does Not Compute"
      get_move
    end     
  end 

  def player_sel()
    if current_player == @player1
        @current_player = player2
    else current_player == @player2
        @current_player = player1
    end
    @current_player
  end
end

