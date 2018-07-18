class Board
	attr_accessor :board, :marker, :choice
    def	initialize()
          p "             "
          p "     Pick a number to multiply by itself to set a board size"
          p "             "
          p "           3X3 is the smallest playable board                "
          p "             "
          p "             "
          p "                     ~^0v0^~               "
          p "             "
          print "\\\H9000::\\\TTT::\\\TICTAC>>>"

      user_input = gets.chomp.to_i
      @size = user_input
      @board = Array.new((@size * @size), "")
       
          puts "   <<<SIZE>>>#{@size}X#{@size}<<<<in boardclass<<<< SIZE "
          puts "   <<<BOARD>>in boardclass>   #{@board.length} <<<<<<<<<<<<<<<<<<<<<<LENGTH "
          # puts "   <<<SHOWBOARD>>in boardclass>   #{@showboard.length} <<<<<<<<<<<<<<<<<<<<<<LENGTH "

    end

    def place_marker(marker,choice)
       p ">>>>>#{choice}is this getting there??????????????"
	    @board[choice.to_i - 1] = marker
      @board
      p "this is #{@board}"
	  end

    def val_spot(board,marker)
      bob = marker.to_i
      choice = bob -1
        if choice > @board.length  || choice < 0              ## hoped this'd work
          false
        elsif @board[choice] == "x" || @board[choice] == "o"
          false
        else
          true
        end
    end

    def full?()
      if @board.include?("")
        false
      else
        true
      end
    end

    # def win_combos(board,size)
    #   combos = [[fSlash],[bSlash],[across],[upNdown]]
      
    #     board.each do |diagWins|        ##~~Diag. Combos
    #       fSlash = @size + (@size-1)    ##~~TopRight to bottomLeft
    #       bSlash = @size + (@size+1)    ##~~
    #     end  
    # end

    def win_combos(board)
      [[@board[0],@board[1],@board[2]],
       [@board[3],@board[4],@board[5]],
       [@board[6],@board[7],@board[8]],
       [@board[0],@board[3],@board[6]],
       [@board[1],@board[4],@board[7]],
       [@board[2],@board[5],@board[8]],
       [@board[0],@board[4],@board[8]],
       [@board[2],@board[4],@board[6]]]
     end


    def winr(board)
      win = []
        win_combos(board.board).each do |comb|
          if comb[0] == "x" && comb[1] == "x" && comb[2] == "x"
            win << true
          elsif comb[0] == "o" && comb[1] == "o" && comb[2] == "o"
            win << true
          else
            win << false
          end
        end
      win.include?(true)
    end

end
