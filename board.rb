class Board
	attr_accessor :board, :marker, :choice, :combos
    
  def	initialize()
    finalboard = []
    @combos = []
      p "                                                             "
      p "     Pick a number to multiply by itself to set a board size "
      p "                                                             "
      p "                                                             "
      p "           3X3 is the smallest playable board                "
      p "                                                             "
      p "                     ~^0v0^~                                 "
      p "                                                             "
      print "\\\H9000::\\\TTT::\\\TICTAC>>>:"
    user_input = gets.chomp.to_i
      if user_input < 3
        puts "  Seriously now??... You read this ^^above^^ right?? 
                Pick a valid multiplier please... "
        sleep(1.5)
        initialize()
      else  
        @size = user_input
        @board = Array.new((@size * @size), " ")
      end  
        puts "      <<<<<<SIZE>>>>>><<<#{@size}>>><X><<<#{@size}>>>>>>"  
  end
    
  def place_marker(marker,choice)
      # p "@boardchoice is #{choice}<<<<<<INPLACEMARKER"
    @board[choice.to_i] = marker
    @board
     # p "this is #{@board}"
  end
  
  def val_spot(board,marker)
    bob = marker.to_i
    choice = bob
    if choice > @board.length  || choice < 0              ##
      false
    elsif @board[choice] == "x" || @board[choice] == "o"
      false
    else
      true
    end
  end

  def full?()
    if @board.include?(" ")
      false
    else
      true
    end
  end

  def win_combos(board)                   ## Building//defining winning combos with a loop and some sequentially nested loops...Kinda proud of this one :)
    @combos = []
    lr_diag = []
    rl_diag = []
    y_combo = []
    x_combo = (0..(@size * @size) - 1).each_slice(@size).to_a      ##
    lr_1pos = 0
    rl_1pos = @size - 1
    lr_count = @size + 1
    rl_count = @size - 1
    x_count = @size + @size
    y_row_count = 0
    y_count = 0   
      @size.times.with_index do
        y_row = []
        lr_diag << lr_1pos
        lr_1pos += lr_count
        rl_diag << rl_1pos
        rl_1pos += rl_count 
          @size.times do
            y_row << y_count
            y_count += @size
          end 
        y_row_count += 1
        y_count = y_row_count
        @combos << y_row
        x_combo.each do |com|
          @combos << com
        end
      end
        # p "#{lr_diag}<<<LR>...."
        # p "#{rl_diag}<<<RL>...."
        # p "#{x_combo}<<<X>...." 
        # p "#{y_combo}<<<Y>..."
    @combos << lr_diag 
    @combos << rl_diag 
    @combos = @combos.uniq.compact
  end
        
    def winr(board)           ##-- Checking board for winning combos
      finalboard = []
      win_combos(board)
        @combos.each do |testing|
        fullrow = []
          testing.each do |boardstate|      ##-- Iterate through board positions
            # p "BOARDSTATE is <<<#{boardstate}>>>"
            # p "winning combos in boardstate <<<#{board.board[boardstate]}>>>"
            fullrow << board.board[boardstate]
          end
          finalboard << fullrow
            finalboard.each do |finaliterationihope|
              xwin = finaliterationihope.select { |marker| marker.include?('x')}.size       ##-- This is awesome too,..nice short iteration checking all positions
              owin = finaliterationihope.select { |marker| marker.include?('o')}.size       ##-- containing matching markers and the size of the array against the
              if xwin == @size || owin == @size                                             ##-- length of the actual board row ...thankyuu Grant and Googl
                  return true 
              end
            end
        end
      end
end

