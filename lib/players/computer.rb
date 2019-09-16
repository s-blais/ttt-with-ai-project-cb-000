module Players
  class Computer < Player

    attr_reader :board, :free_spaces
    attr_accessor :block_or_win_index

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
      if !board.taken?(5)
        "5"
      # elsif block_or_win?(board)
      else find_free_spaces(board).sample
      end
    end

    # def block_or_win?(board)
    #   @block_or_win_index = nil
    #   WIN_COMBINATIONS.detect do |combo|
    #     if combo.select{|i| board.cells[i] == "X"}.length == 2
    #       @block_or_win_index = (combo.detect {|i| board.cells[i] == " "}).to_i
    #     end
    #   end
    #   return (@block_or_win_index) + 1 if @block_or_win_index != nil
    # end


    #   block_or_win_space = nil
    #   target_combo = WIN_COMBINATIONS.find do |combo|
    #     combo.count{|i| board.cells[i] == "X"} == 2 or
    #     combo.count{|i| board.cells[i] == "O"} == 2
    #     end
    #   target_combo.find{|i| combo[i] == " "}
    # end
    #
    # def take_center_if_open(board)
    #   5 if !taken?(5)
    # end


  end

end
