require_relative 'sliding_piece'
require_relative 'piece'
require_relative 'board'

class Queen < Piece

  include SlidingPiece

  SETUP_POS = [[0, 3], [7, 3]]

  def self.set_up
    SETUP_POS
  end

  def symbol
    if @color == :white
      " \u2655 ".encode('utf-8')
    else
      " \u265B ".encode('utf-8')
    end
  end

  def move_dirs
    [:left, :right, :up, :down, :top_left, :top_right, :bottom_left, :bottom_right]
  end

end

if __FILE__ == $PROGRAM_NAME
  queen = Queen.new([5,5])
  p queen.moves
end
