require_relative "board.rb"
require_relative "console.rb"

class Playerhuman                                 ##~~ Need to change to a single player class and define each instead
  attr_accessor :marker, :name
    def initialize(marker)
      @marker = marker
      @name = name
    end 
  def move(board, size)
    p "                                           "
    p "                                           "
    p " OK Human...Pick a spot...1 - #{board.size}"
    p "                                           "
    p "                                           "
    print "\\\H9000::\\\TTT::\\\TICTAC>>>"
    choice = gets.chomp.to_i
  end
end   

class Playerseq
  attr_accessor :marker, :name 
    def initialize(marker)
      @marker = marker
      @name = name
    end
  def move(board, size)	
  ind = []
      board.each_with_index do |val,index|
        if val == "x" || val == "o"  
        else 
          ind << index+1
        end	
      end
    ind.first
  end
end

class Playerrand 
  attr_accessor :marker, :name 
  	def initialize(marker)
      @marker = marker
      @name = name
	  end
  def move(board, size)	
  ind = []
    board.each_with_index do |val,index|
      if	val == "x" || val == "o"
      else 
        ind << index+1
      end	
    end
    ind.sample    
	end	
end 
    
class Playerunbeets
  attr_accessor :marker, :name, :board, :size
    def initialize(marker)
      @marker = marker
      @name = name
      @board
      @size
    end

  def f_move(board, size)	
    choice = board.length % 2                   ##~~ Picking the midlle pos. first (on odd sized boards)
  end

  def move(gameboard, size)
    c1 = size - size                 ##~~Upper Left
    c2 = size                     ##~~Upper Right
    c3 = gameboard.length - size    ##~~Bottom Left
    c4 = gameboard.length             ##~~Bottom Right
    corners = [c1, c2, c3, c4]        ##~~All corners
    @prioritychoice = []              ##~~Choice if 
    @normalchoice = []                ##~~
    @combos = $game.board.win_combos(gameboard)       ##~~ Iterating through winning combos array
                  # p ">>><<<<<{{CORNERS HERE_<<<<#{corners}>>>>__>CZHECH 'EM OUT}}"
                  # p "COMBOS HERE >>> L00K AT 'EM<<<<<#{@combos}>>>>>"
                  # p "<<<<<#{gameboard}>>><<<GAMEBOARD>>>>>>>>"
    @combos.each do |comboarr|                      ##~~ Now... through each individual array
      @testarr = []
      @limit = comboarr.length
                  # p "<<<<<<<#{comboarr}>>>>>>> is COMBOARRAY____"
        comboarr.each do |boardspot|
          @testarr << gameboard[boardspot]                            ##~~vvvvvv__Some fancy footwork here__vvvvvv
            if @testarr.size == comboarr.size && @testarr.select {|marker| marker.include?("x")}.size >= comboarr.size - 2 && @testarr.select {|marker| marker.include?("o")}.size == 0
              comboarr.each do |finalspot|
                if gameboard[finalspot] == " "
                  @prioritychoice << finalspot
                end
              end
            elsif @testarr.size == comboarr.size && @testarr.select {|marker| marker.include?("x")}.size >= 1 && @testarr.select {|marker| marker.include?("o")}.size == 0
              comboarr.each do |finalspot|
                if gameboard[finalspot] == " "
                  @normalchoice << finalspot
                end
              end
            end
        end
    end
      if @prioritychoice == []
        return @normalchoice.sample
      elsif @prioritychoice != []
        return @prioritychoice[0]
      else
        free(gameboard)
    end
  end
  #               # p "COMBOS HERE >>> AT 'EM<<<<<#{@combos}>>>>>"
  #               # p "<<<<<<<#{comboarr}>>>>>>> is COMBOARR____"
  #               # p "<<<<__#{@testarr}__>>>> to TESTARRAY____"
  #               p "TESTARRAY___ LENGTH is {{{__#{@testarr.length}__}}} and LIMIT is [[[__#{@limit}__]]]"
  #               # p "GAMEBOARD___ is <<<__#{gameboard[boardspot]}__>>> and BOARDSPOT____ is (((__#{boardspot}__)))"
  #               # p "<<<<<#{gameboard}>>><<<GAMEBOARD>>>>>>>>"
  
        ##~~Free move if no other conditionals are met~~##
  def free(board)
    choice = 999999913
    opnspot = []
    # p "FREEMOVE IS FIRING<<<<<<<<<<<<<<<<<<<<<<<<<<<<!!!!!!<<<<<<<<<<<"
      board.each_with_index do |val, i|
        if val == " "
          opnspot << i
        end
      end
      choice = opnspot.sample
  end
end 
  
##~~ ORIGINAL ~~##
# class Playerunbeets
#   attr_accessor :marker, :name 
#     def initialize(marker)
#       @marker = marker
#       @name = name
#     end
#   def win_move(board)
      
#     board_state = [
#       [board[0],board[1],board[2]],
#       [board[3],board[4],board[5]],
#       [board[6],board[7],board[8]],
#       [board[0],board[3],board[6]],
#       [board[1],board[4],board[7]],
#       [board[2],board[5],board[8]],
#       [board[0],board[4],board[8]],
#       [board[2],board[4],board[6]]]
      
#       winnums = [[0,1,2], [3,4,5], 
#         [6,7,8], [0,3,6], [1,4,7], 
#         [2,5,8], [0,4,8], [2,4,6]]
#       choice = 9999999913
#       board_state.each_with_index do |vals, index|
#         if  vals.count(@marker) == 2 && vals.count("") == 1
#           win = vals.index("")
#           choice = winnums[index][win]
#             # p "_____________________markeris_____#{@marker}_IS HERREE______________________________"
#             # p "___OTHERMARKER__________#{other_marker}_________________HERE___________________________"
#         end
#       end
#       choice
#     end
#   ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
#   def block_move(board, other_marker)
     
#         board_state = [
#           [board[0],board[1],board[2]],
#           [board[3],board[4],board[5]],
#           [board[6],board[7],board[8]],
#           [board[0],board[3],board[6]],
#           [board[1],board[4],board[7]],
#           [board[2],board[5],board[8]],
#           [board[0],board[4],board[8]],
#           [board[2],board[4],board[6]]]
          
#           winnums = [[0,1,2], [3,4,5], 
#             [6,7,8], [0,3,6], [1,4,7], 
#             [2,5,8], [0,4,8], [2,4,6]]
#           choice = 13
#           board_state.each_with_index do |vals, index|
#             if  vals.count(other_marker) == 2 && vals.count("") == 1
#               win = vals.index("")
#               choice = winnums[index][win]    
#                 # p "_____________________markeris_____#{@marker}_IS HERREE______________________________"
#                 # p "___OTHERMARKER__________#{other_marker}_________________HERE___________________________"
#             end
#           end
#           choice
#         end
#   # p "_________________________________________________________"

#   ###(((((()))((((((()))))((((((FirstMove))))))(((((()))(((((())))))))))###
#   def f_move(board)	
#     corner = [0,2,6,8]    ###  corner spots
#     edge = [1,3,5,7]     ###  edge spots
#     choice = 0        ###  def. choice

#     if corner.any? {|a| board[a] == "x"}  ###  checking for filled corner spots 
#          choice = 4
#     elsif board[4] == "x"
#          choice = 0
#     else edge.any? {|a| board[a] == "x"}   ###  checking for filled edge spots
#          choice = 4
#     end
#   end  
# ###(((((()))((((((()))))((((((FreeChoice))))))(((((()))(((((())))))))))###    
#   def free(board)
#       choice = 999999913
#       ospot = []
#     board.each_with_index do |val, i|
#       if val == " "
#       ospot << i
#       end
#     end
#       choice = ospot.sample
#   end

# ###(((((()))((((((()))))((((((EdgeMove))))))(((((()))(((((())))))))))###
#   def get_edge(board, other_marker)
      
#     board_diag =  [[board[0], board[4], board[8]],    
#         [board[2], board[4], board[6]]]
 
#         choice = 999999999913
        
#       board_diag.each_with_index do |vals, index|
#         if vals.count(@marker) == 1 && vals.count(other_marker) == 2
#           if  board[1] == " "
#               choice = 1
#           elsif board[3] == " "
#               choice = 3
#           elsif board[5] == " "
#               choice = 5
#           else board[7] == " "
#               choice = 7
#           end
#         end
#       end
#     choice
#   end
# ###(((((()))((((((()))))((((((SecMove))))))(((((()))(((((())))))))))###
#   def sec_move(board)
    
#     one_eight = [0,7]
#     one_six = [0,5]
#     three_eight = [2,7]
#     three_four = [3,4]
#     seven_two = [1,6]
#     seven_six = [5,6]
#     nine_two = [1,8]
#     nine_four = [3,8]
#     choice = 99999913
    
#     if one_eight.all? {|a| board[a] == @marker}
#          choice = 5
#     elsif one_six.all? {|a| board[a] == @marker}
#       if board[2] == " "
#          choice = 2
#       else choice = free(board)
#       end
#     elsif three_eight.all? {|a| board[a] == @marker}
#       if board[8] == " "
#          choice = 8
#       else choice = free(board)
#       end
#     elsif three_four.all? {|a| board[a] == @marker}
#       if board[0] == " "
#          choice = 0
#       else choice = free(board)
#       end
#     elsif seven_two.all? {|a| board[a] == @marker}
#          choice = 0
#     elsif seven_six.all? {|a| board[a] == @marker}
#       if board[2] == " "
#          choice = 2
#       else choice = free(board)
#       end
#     elsif nine_two.all? {|a| board[a] == @marker}
#       if board[0] == " "
#          choice = 0
#       else choice = free(board)
#       end
#     else nine_four.all? {|a| board[a] == @marker}
#       choice = 0
#    end
#     choice
#   end

#   def move(board, dontmatta)
#       if @marker == "x"
#         other_marker = "o" 
#       else 
#         other_marker = "x"
#       end    
#    #  puts "def move board is firing.................!!!!!!!!!!!!!!!"
#     choice = 9999999913
#     if board.count("x") <= 1
#         # puts  "_______FIRSTMOVE________  is firing.................!!!!!!!!!!!!!!!"
#         choice = f_move(board)
#     elsif win_move(board) <= 8
#         # puts  "_______WINMOVE_________  is firing.................!!!!!!!!!!!!!!!"
#         choice = win_move(board)
#     elsif block_move(board, other_marker) <= 8
#         # puts  "_______BLOCKMOVE____________  is firing.................!!!!!!!!!!!!!!!"
#         choice = block_move(board, other_marker)
#     elsif get_edge(board, other_marker) <= 8
#         # puts  "_______EDGEMOVE____________  is firing.................!!!!!!!!!!!!!!!"
#         choice = get_edge(board,other_marker)
#     elsif sec_move(board) <= 8
#         # puts  "_______SECONDMOVE_________  is firing.................!!!!!!!!!!!!!!!"
#         choice = sec_move(board)
#     else free(board) <= 8
#         choice = free(board) 
#     end
#    choice
#   end
# end