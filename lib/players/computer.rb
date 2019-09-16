module Players
  class Computer < Player

    attr_reader :board, :free_spaces


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
      game.WIN_COMBINATIONS.each do |combo|
          if (combo.count{|i| board.cells[i] == "X"}) == 2
            combo.index(" ")
          elsif (combo.count{|i| board.cells[i] == "O"}) == 2
            combo.index(" ")
          # else
          #   find_free_spaces(board).sample
          end
        end
    end

    def take_center_if_open(board)
    end


  end

end
