require_relative 'stepping_piece'
require_relative 'piece'
require_relative 'board'

class Knight < Piece

  include SteppingPiece

  SETUP_POS = [[0, 1], [0, 6], [7, 1], [7, 6]]

  def self.set_up
    SETUP_POS
  end


  def symbol
    if @color == :white
      " \u2658 ".encode('utf-8')
    else
      " \u265E ".encode('utf-8')
    end
  end

  def move_dirs
    [:NNW, :NNE, :WNW, :ENE, :SSW, :SSE, :ESE, :WSW]
  end

end

if __FILE__ == $PROGRAM_NAME
  knight = Knight.new([5,5])
  p knight.moves
end
