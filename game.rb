require_relative "console.rb"

$game = Console.new
#  $game = run
p ""
p ""
p ""
puts   "        _______________       ___                 ______________"
puts   "        \\__     __/|__|_\_____/  |_________________\\___      ___/ "
puts   "        |    |   |  |/  __/   ____/__    //   __/  |    |  ____________"    
puts   "        |    |   |  \\  \\__    __/  __   //   \\_    |    |// ___  |__\\ \\"
puts   "        |    |   |__|\\____/|  | (_______/\\_____/   |    | | |__| |____/  "
puts   "             \\____/             |__|                    \\____//\\______|_______/"
p ""
p ""
p ""
  until $game == "done" do
    $game.print_board
    $game.get_move
    # print "<<<<<<THIS IS MOVE IN GAME #{move}"
    # $game.checkval(move)
    $game.print_board
      if $game.board.winr($game.board) == true
        if $game.current_player.marker == "x"
          p "                        "
          p " Player O Wins This One "
          p "                        "
        else
          p "                        "
          p " Player X Wins This One "
          p "                        "
        end
      $game = "done"
      elsif $game.board.full? == true
        p "                         "
        p "   KiTTTy Got Ittt!!!    "  
        p "                         "
        $game = "done"
      end  
  end
