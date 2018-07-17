class Playerhuman
  attr_accessor :marker, :name
    def initialize(marker)
      @marker = marker
      @name = name
    end 
    def move(board, size)
      p "                            "
      p "OK Human...Pick a spot...1-9"
      choice = gets.chomp.to_i
    end
  end   
  ##-------##
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
    # p"#{val}....valuuuuueeeee"
    # p "#{index}.....indexxxxxxx"	
        end
      ind.first
    end
end
##-------##
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
    ##-------##
class Playerunbeets
  attr_accessor :marker, :name
    def initialize(marker)
        @marker = marker
        @name = name
        @size = board.board.size
    end  
    def win_move(board)
      board_state = [
        [board[0],board[1],board[2]],
        [board[3],board[4],board[5]],
        [board[6],board[7],board[8]],
        [board[0],board[3],board[6]],
        [board[1],board[4],board[7]],
        [board[2],board[5],board[8]],
        [board[0],board[4],board[8]],
        [board[2],board[4],board[6]]]
      
      winnums = [[0,1,2], [3,4,5], 
        [6,7,8], [0,3,6], [1,4,7], 
        [2,5,8], [0,4,8], [2,4,6]]
      choice = 999999999999999999913
        board_state.each_with_index do |vals, index|
          if vals.count(@marker) == 2 && vals.count("") == 1
            win = vals.index("")
            choice = winnums[index][win]
            # p "_____________________markeris_____#{@marker}_IS HERREE______________________________"
            # p "___OTHERMARKER__________#{other_marker}_______"
          end
        end
      choice+1
    end
    
    def block_move(board, other_marker)
      board_state = [
      [board[0],board[1],board[2]],
      [board[3],board[4],board[5]],
      [board[6],board[7],board[8]],
      [board[0],board[3],board[6]],
      [board[1],board[4],board[7]],
      [board[2],board[5],board[8]],
      [board[0],board[4],board[8]],
      [board[2],board[4],board[6]]]
      
      winnums = [[0,1,2], [3,4,5], 
          [6,7,8], [0,3,6], [1,4,7], 
          [2,5,8], [0,4,8], [2,4,6]]
      choice = 999999999999999999913
        board_state.each_with_index do |vals, index|
          if  vals.count(other_marker) == 2 && vals.count("") == 1
            win = vals.index("")
            choice = winnums[index][win]    
              # p "_____________________markeris_____#{@marker}_IS HERREE______________________________"
              # p "___OTHERMARKER__________#{other_marker}_________________HERE___________________________"
          end
        end
      choice+1
    end
  # p "_________________________________________________________"

  def f_move(board, size)	
                        ##~~UpperRight
                                    ##~~Corner spots
    c1 = board[0]                 ##~~Upper Left
    c2 = @size
    c3 = board.length-(@size)-1    ##~~Bottom Left
    c4 = board.length             ##~~Bottom Right
    corners = [[c1], [c2], [c3], [c4]]
    edge = []                      ##~~Edge spots
    choice = 0                    ##~~Def choice
      board.each do |leftEdge|    ##~~Get left edge posit.'s
        board[0] + (@size)+1
      end

      if corners.any? {|a| board[a] == "x"}   ##~~checking for filled corner spots 
        choice = (board.length/2+1)               ##~~choosing centerSpot 
      elsif (board.length/2 == "x")
        choice = (@size-(@size)-1)
      else edge.any? {|a| board[a] == "x"}   ##  checking for filled edge spots
        choice = 5
      end
    end    
        ##~~Free move if no other conditionals are met~~##
    def free(board)
      choice = 999999999999999999913
      opnspot = []
        board.each_with_index do |val, i|
          if val == ''
            opnspot << i
          end
        end
        choice = opnspot.sample
    end

  ##~~ Taking edge moves if possible ~~##
    def get_edge(board, other_marker)
      board_diag = [[board[0], board[4], board[8]], [board[2], board[4], board[6]]]
      # board_diag =  [[board.size % or * ]]
      choice = 999999999999999999913
        board_diag.each_with_index do |vals, index|
          if vals.count(@marker) == 1 && vals.count(other_marker) == 2
            if  board[1] == ""
              choice = 2
            elsif board[3] == ""
              choice = 4
            elsif board[5] == ""
              choice = 6
            else board[7] == ""
              choice = 8
            end
          end
        end
      choice
    end

    def sec_move(board, size)    
      one_eight = [0,7]
      one_six = [0,5]
      three_eight = [2,7]
      three_four = [3,4]
      seven_two = [1,6]
      seven_six = [5,6]
      nine_two = [1,8]
      nine_four = [3,8]
      choice = 10
        if one_eight.all? {|a| board[a] == @marker}
            choice = 6
        elsif one_six.all? {|a| board[a] == @marker}
          if board[2] == ''
            choice = 3
          else choice = free(board)
          end
        elsif three_eight.all? {|a| board[a] == @marker}
          if board[8] == ''
            choice = 9
          else choice = free(board)
          end
        elsif three_four.all? {|a| board[a] == @marker}
          if board[0] == ''
            choice = 1
          else choice = free(board)
          end
        elsif seven_two.all? {|a| board[a] == @marker}
            choice = 1
        elsif seven_six.all? {|a| board[a] == @marker}
          if board[2] == ''
            choice = 3
          else choice = free(board)
          end
        elsif nine_two.all? {|a| board[a] == @marker}
          if board[0] == ''
            choice = 1
          else choice = free(board)
          end
        else nine_four.all? {|a| board[a] == @marker}
          choice = 1
      end
        choice
    end
    
    def move(board, size)
      if @marker == "x"
        other_marker = "o" 
      else 
        other_marker = "x"
      end    
          #  puts "def move board is firing.................!!!!!!!!!!!!!!!"
      choice = 999999999999999999913
        if board.count("x") <= 1
            # puts  "_______FIRSTMOVE________  is firing.................!!!!!!!!!!!!!!!"
            choice = f_move(board, size)
        elsif win_move(board, size) <= 9
            # puts  "_______WINMOVE_________  is firing.................!!!!!!!!!!!!!!!"
            choice = win_move(board, size)
        elsif block_move(board, other_marker, size) <= 9
            # puts  "_______BLOCKMOVE____________  is firing.................!!!!!!!!!!!!!!!"
            choice = block_move(board, other_marker, size)
        elsif get_edge(board, other_marker, size) <= 9
            # puts  "_______EDGEMOVE____________  is firing.................!!!!!!!!!!!!!!!"
            choice = get_edge(board, other_marker, size)
        elsif sec_move(board, size) <= 9
            # puts  "_______SECONDMOVE_________  is firing.................!!!!!!!!!!!!!!!"
            choice = sec_move(board, size)
        else free(board) <= 9
            choice = free(board) 
        end
      choice
    end
end 
  

 


# board is //[:board, :winr, :marker, :full?, :choice, :val_spot, :place_marker, :marker=, :board=, :win_combos, :choice=, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :public_send, :method, :public_method, :instance_variable_defined?, :define_singleton_method, :instance_variable_set, :singleton_method, :extend, :to_enum, :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?, :freeze, :inspect, :object_id, :send, :display, :to_s, :nil?, :hash, :class, :singleton_class, :clone, :dup, :itself, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variable_get, :instance_variables, :!, :==, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]



# " ////[\"1\", \"2\", \"x\", \"4\", \"x\", \"6\", \"x\", \"8\", \"9\", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, \"o\", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, \"o\"]<<<<<<<<<<<<<"