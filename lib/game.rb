class Game

  attr_accessor :player_1, :player_2, :board
  attr_reader :winning_token

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # first column
    [1,4,7], # second column
    [2,5,8], # third column
    [0,4,8], # diagonal top to bottom
    [2,4,6]  # diagonal bottom to top
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
        if win_combo.all? { |i| board.cells[i] == "X" }
          @winning_token = "X"
          return win_combo
        elsif win_combo.all? { |i| board.cells[i] == "O" }
          @winning_token = "O"
          return win_combo
        end
      end
    false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    @winning_token if won?
  end

  def turn
    # player = current_player
    move_attempt = current_player.move(board)
    if board.valid_move?(move_attempt)
      board.update(move_attempt, current_player)
      board.display
    else turn
    end
  end

  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{@winning_token}!"
      elsif draw?
        puts "Cat\'s Game!"
      end
  end



end
