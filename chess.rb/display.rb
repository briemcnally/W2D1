require 'colorize'
require_relative "cursor.rb"

class Display

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    while true
      @board.render(@cursor.cursor_pos)
      @cursor.get_input
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  d = Display.new
  d.render
end
