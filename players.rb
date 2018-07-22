require_relative "board.rb"
require_relative "console.rb"

# def initialize()
# end

class Playerhuman
  attr_accessor :marker, :name
    def initialize(marker)
      @marker = marker
      @name = name
    end 
    def move(board, size)
      p "                            "
      p "                            "
      p "OK Human...Pick a spot...1 - #{board.size}"
      p "                            "
      p "                            "
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
    # p"#{val}....valuuuuueeeee"
    # p "#{index}.....indexxxxxxx"	
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
    choice = 0                    ##~~Def choice
      
  end

  def move(gameboard, irrelevant)
    @combos = $game.board.win_combos(gameboard)
    @combos.each do |comboarr|
      @testarr = []
      @mark_arr = []
      @limit = comboarr.length
      counter = 0 
        comboarr.each do |boardspot|
          @testarr << gameboard[boardspot]
              if @testarr.select { |marker| marker.include?("x")}.size >= 1 && @testarr.select { |marker| marker.include?("o")}.size == 0 
                # p "COMBOS HERE >>> AT 'EM<<<<<#{@combos}>>>>>"
                # p "<<<<<<<#{comboarr}>>>>>>> is COMBOARR____"
                # p "<<<<__#{@testarr}__>>>> to TESTARRAY____"
                p "TESTARRAY___ LENGTH is {{{__#{@testarr.length}__}}} and LIMIT is [[[__#{@limit}__]]]"
                # p "GAMEBOARD___ is <<<__#{gameboard[boardspot]}__>>> and BOARDSPOT____ is (((__#{boardspot}__)))"
                # p "<<<<<#{gameboard}>>><<<GAMEBOARD>>>>>>>>"

              return choice = @testarr.sample
            end  
          choice
          end
        end
      free(gameboard)
  end



        ##~~Free move if no other conditionals are met~~##
    def free(board)
      choice = 999999913
      opnspot = []
      p "FREEMOVE IS FIRING<<<<<<<<<<<<<<<<<<<<<<<<<<<<!!!!!!<<<<<<<<<<<"
        board.each_with_index do |val, i|
          if val == " "
            opnspot << i
          end
        end
        choice = opnspot.sample
    end
  
    
end 
  

 