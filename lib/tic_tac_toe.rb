require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index (user_input)
    # user_input = user_input.to_i - 1
    user_input.to_i - 1
  end

  def move(board_index, token = "X")
    @board[board_index] = token
  end

  def position_taken?(idx)
    @board[idx] == 'X' || @board[idx] == 'O' ? true : false

  #  if @board[idx] == " "
  #   return false 
  #  else 
  #   return true
  #  end 
  end

  # ~~~~~~~ Z CODE ~~~~~~~

  # functionality: returns true/false based on whether the position is already occupied
  # NOTE:
    # STEP 1) make sure the index being passed in is a valid index on the board
      # board only has 9 postions, so 8 index numbers
      # google 'ruby between method', there are may ways to get this same functionality 
    # STEP 2) the method funtions as an opposite to the #positon_taken? 
      # if the positon is taken on the boad, then the move is INVALID b/c a user should
      # NOT be able to move there 
    # 
  def valid_move?(selected_index)
    # really simiplifed code, vaild move should ALWAYS return the opposite value of
    # what #position_taken returns, b/c the logic is inversed
    selected_index.between?(0,8) && !position_taken?(selected_index)

    # longer version of line 59
      # make sure selected_index, is an index on the board
      # remember #position_taken? returns a boolean
    # if selected_index.between?(0,8) && !position_taken?(selected_index)
    #   true
    # else
    #   false 
    #   # index number doesn't have a postion in the board array
    #   # OR the spot it taken, so a user shouldn't be able to move into that spot
    # end
  end 

  # functionality: counts occupied positions in the board
  def turn_count
    # counting all the X's & O's on the board
    # add values together
    @board.count('X') + @board.count('O') 
  end

  # functionality: returns the token of player, based on the number of turns that have occured
  # NOTE:
    # remember in a game of TTT, 'X' usually goes first, that's considered turn 1
    # the 'X' token is associated w/odd turns & 'O', with even
  def current_player
    turn_count.odd? ? "O" : "X"
  end

  # functionality: teach computer to play a 'turn' in TTT => 1 turn occurs when a player puts their token on the board
  # NOTES: 
    # STEP 1) output user instruction
    # STEP 2) ask for input
    # STEP 3) take input & convert to an index, so game_obj can use info
      # remember the game_obj is working w/an array and bases
      # ALL moves from an index number
    # STEP 4) determine if move is valid
      # STEP 4a) if valid, place token in the board array & display the NEW board
      # STEP 4b) if INvalid, start process over
  def turn
    puts "Please enter 1-9: "
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  # functionality: determine if ANYONE has won the game
  # NOTES: i.e: @board = ['X', 'X', 'X', 'O','O', ' ', ' ', ' ', ' ']
    # in order to win, all the tokens in a particular row/order MUST BE EQUAL to each other 
    # STEP 1) iterator on WIN_COMBINATIONS array
    # STEP 2) win_combo_arr = [0,1,2], those are the index numbers of winning combos
      # 2a) access each index number in the win_combo_arr, i.e: win_combo_arr[0] => 0
      # 2b) use the winning index, to get the element at that positon in board, 
        # i.e: @board[win_combo_arr[0]] => @board[0] => 'X'
      # 2c) compare the 1st value with every othe value
        # they all must be equal to each other in order to have a winnning combo
        # @board[win_combo_arr[0]] == @board[win_combo_arr[1]] && ....
    # STEP 3) return the winning combination  
  def won?
    WIN_COMBINATIONS.find do |win_combo_arr|
      @board[win_combo_arr[0]] == @board[win_combo_arr[1]] && @board[win_combo_arr[1]] == @board[win_combo_arr[2]] && position_taken?(win_combo[0])
     end
  end

  # functionality: check if the board is full
  # google 'ruby all iterator'
  def full?
    @board.all?{|element| element == "X"||element == "O"}
  end


  # functionality: determine if the game is a draw
  # NOTES: what determines a draw, if the game is NOT won AND the board is full
  def draw?
    !won? && full?
  end


  # functionality: determine if the game is a over
  # NOTES: what determines if a gamme is over, if the game is won OR the board is full
  def over?
    won? || draw?
  end

  # QUESTION: What do the last three methods return? Remember what the '?', signifies on a method name?

  # functionality: determine which token won the game
  def winner
    # think about how you determin if the game is won? (<= HINT HINT)
    # all pay attention 2 test expected return value
  end

  # functionality: method that allow the computer to pay a FULL game of TTT
  def play
    # think about how people play a game, how do we know when the game is over?
    # remember you created A LOT of methods above, which can you utilize to make
    # this method function, as the tests want
  end

  # this is a class method
  # def self.class_method
  # end
end

# game = TicTacToe.new
# game.display_board