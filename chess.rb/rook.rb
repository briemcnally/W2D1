require_relative 'sliding_piece'
require_relative 'piece'

class Rook < Piece

  include SlidingPiece

  def symbol
    '/u2656'.encode('utf-8')
  end

  def move_dirs
    [:left, :right, :up, :down]
  end
end
