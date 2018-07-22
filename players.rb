require_relative "board.rb"

def initialize()
end

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
  attr_accessor :marker, :name
    def initialize(marker)
      @marker = marker
      @name = name
      @board
    end  
      
  def f_move(board, size)	
    choice = 0                    ##~~Def choice
      
  end

  def move(gameboard, irrelevant)
    @combos = $game.board.win_combos(gameboard)
              p "COMBOS LOOK AT 'EM<<<<<#{@combos}>>>>>"
    @combos.each do |comboarr|
      @testarray = []
      limit = comboarr.length
              p "<<<<<<<#{comboarr}>>>>>>> is COMBOARR____"
      counter = 0 
      comboarr.each do |boardspot|
        @testarray << gameboard[boardspot]
              puts "<<<<__#{@testarray}__>>>> to TESTARRAY____"
              p "testarray LENGTH is {{{__#{@testarray.length}__}}} and limit length is [[[__#{limit}__]]]"
              p "GAMEBOARD___ is <<<__#{gameboard[boardspot]}__>>> and BOARDSPOT____ is (((__#{boardspot}__)))"
              p "<<<<<#{gameboard}>>><<<GAMEBOARD>>>>>>>>"

          gameboard.limit.times.with_index do
            
          end    


            # boardspot.each do |nDeczhs|
            #   if testarray[count] == nDeczhs

            #   end 
            # end  
        
          # if @testarray.select { |marker| marker.include?('x') || marker.include?('o') }.size
            # choice = limit % 2
            choice = boardspot +3
          # else
          # end
        end
        return choice
      end
      free(gameboard)
  end
          # p "counter is #{counter}"
          # comboarr.each do |boardspot|
          #   puts "comboboardspot is #{boardspot}"
          #   tempcombos = @combos[endex]
          #   puts "@combos endex is #{@combos[endex]}"
          #   tempcombos.each do |emptyindex|
                # puts "emptyindex is #{emptyindex}"
                # puts "looking in finalboard #{@finalboard}"
                # puts "finalspot to check is #{@finalboard[endex][emptyindex]}"
                # if gameboard[emptyindex] == " "
                #   p "TEMPCOMBO IS #{tempcombos[endex][emptyindex]}"
                #   @finalchoice = tempcombos[endex][emptyindex]
                #   p "THIS IS YOUR FINAL CHOICE #{@finalchoice}"
                # end

          # end
        # end
              
          # @finalboard.each.with_index do |finaliterationihope, endex|
          #   xwin = finaliterationihope.select { |marker| marker.include?('x')}.size
          #   owin = finaliterationihope.select { |marker| marker.include?('o')}.size
          #   # puts "xwin size is #{xwin} owin size is #{owin} size is #{irrelevant} index this is #{endex}"
          #     puts "LOOK AT ALL THESE COMBOS #{@combos} ENDEX IS #{endex}"
          #     end
          #     tempcombos = @combos[endex]
          #     puts "@combos endex is #{@combos[endex]}"
          #     tempcombos.each do |emptyindex|
          #       # puts "emptyindex is #{emptyindex}"
          #       # puts "looking in finalboard #{@finalboard}"
          #       # puts "finalspot to check is #{@finalboard[endex][emptyindex]}"
          #       p ""
          #       if gameboard[emptyindex] == " "
          #         p "TEMPCOMBO IS #{tempcombos[endex][emptyindex]}"
          #         @finalchoice = tempcombos[endex][emptyindex]
          #         p "THIS IS YOUR FINAL CHOICE #{@finalchoice}"
          #       end
          #     end


          #   @finalchoice = @finalchoice + 1
          # end
    # end



        ##~~Free move if no other conditionals are met~~##
    def free(board)
      choice = 999999913
      opnspot = []
      p "FREEMOVE IS FIRING<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        board.each_with_index do |val, i|
          if val == ' '
            opnspot << i
          end
        end
        choice = opnspot.sample
    end
  
    
end 
  

 