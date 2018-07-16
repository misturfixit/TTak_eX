  def updt_board(board, player, choice)
    board [choice-1] = player
    board
  end 

  def player_sel(player)
    if player == "x"
      player = "o"
    elsif player == "o"
      player = "x"
    end   
    player
  end 

  def val_space(board, choice)
    choice = choice-1
      if choice > board.length || choice < 0 || board[choice].include?("x" || "o")
        false
      else 
        true  
      end     
  end 

  def f_board(board)
    board.each
    if board.include?("1")    
      false
    else
      true
    end
  end    

  def win_combos(board)
    [[board[0],board[1],board[2]],
    [board[3],board[4],board[5]],
    [board[6],board[7],board[8]],
    [board[0],board[3],board[6]],
    [board[1],board[4],board[7]],
    [board[2],board[5],board[8]],
    [board[0],board[4],board[8]],
    [board[2],board[4],board[6]]]
  end
  
  def winner(board, player)
    win = []
      win_combos(board).each do |comb|
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
  