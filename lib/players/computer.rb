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
      if block_or_win?(board)
      else find_free_spaces(board).sample
      end
    end

    def block_or_win?(board)
      WIN_COMBINATIONS.each do |combo|
          x_count = combo.count{|i| board.cells[i] == "X"}
          o_count = combo.count{|i| board.cells[i] == "O"}
          if x_count == 2 || o_count == 2
            block_or_win_space = combo.detect{|i| combo[i] == " "}
            binding.pry
          end
        block_or_win_space
      end
    end

    def take_center_if_open(board)
    end


  end

end
