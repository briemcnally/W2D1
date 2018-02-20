require_relative 'stepping_piece'
require_relative 'piece'
require_relative 'board'

class Knight < Piece

  include SteppingPiece

  def symbol
    "\u2658".encode('utf-8')
  end

  def move_dirs
    [:NNW, :NNE, :WNW, :ENE, :SSW, :SSE, :ESE, :WSW]
  end

end

if __FILE__ == $PROGRAM_NAME
  knight = Knight.new([5,5])
  p knight.moves
end
