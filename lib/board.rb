class Board

  attr_accessor :cells # also :player?? :token?

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "\n #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \r"
  end

  def position(input)
    @cells[input.to_i - 1]
    # this converts the input AND returns the value in the array
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  # def token I think this will go in Player?
  # end

  def full?
    @cells.none?(" ")
  end

  def turn_count
    9 - @cells.count(" ")
    # or: @cells.count {|i| i == "X" || i == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
    # or: position(input) != " "
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !(taken?(input))
  end


end
