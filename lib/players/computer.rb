module Players
  class Computer < Player

    attr_reader :board, :free_spaces

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


    def find_free_spaces(board)
      @free_spaces = []
      board.cells.each_with_index do |value, index|
        @free_spaces << (index + 1).to_s if value == " "
      end
      @free_spaces
    end

    def move(board)
      # if block_or_win?(board)
      find_free_spaces(board).sample
      
    end

    def block_or_win?(board)
      target_combo = []
      block_or_win_space = nil
      target_combo = WIN_COMBINATIONS.find do |combo|
        combo.count{|i| board.cells[i] == "X"} == 2 or
        combo.count{|i| board.cells[i] == "O"} == 2
        end
      target_combo.find{|i| combo[i] == " "}
    end

    def take_center_if_open(board)
    end


  end

end
