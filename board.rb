class Board
	attr_accessor :board, :marker, :choice
    def	initialize()
      # @board = ["","","","","","","","",""]
      p "     Pick a number to multiply by itself to set a board size"
      p "     3X3 is obviously the smallest playable board  ~OO~"
      print "TTT::\\TICTAC>>"
      @size = gets.chomp.to_i
      @board = Array.new((@size * @size), "")
        @board.each_slice(@size) do |show|
          p show 
          # puts 
        end
      puts "  >>>#{@size}X#{@size}<<<  "
      puts "   <<<BOARD>>>   #{@Board.length} <<<<<<<<<<<<<<<<<<<<<<LENGTH "

    end

    def place_marker(marker,choice)
      # p "#{choice}is this getting there??????????????"
	    @board[choice.to_i - 1] = marker
		  @board
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

    def win_combos(board,size)
      combos = [[fSlash],[bSlash],[across],[upNdown]]
      
        board.each do |diagWins|        ##~~Diag. Combos
          fSlash = @size + (@size-1)    ##~~TopRight to bottomLeft
          bSlash = @size + (@size+1)    ##~~
        end  
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
