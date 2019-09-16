module Players
  class Human < Player

    attr_reader :board

    def move(board)
      puts "Player #{current_player.token}, please enter 1-9:"
      input = gets.strip
    end

  end

end
