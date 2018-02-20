require_relative 'sliding_piece'
require_relative 'piece'

class Bishop < Piece

  include SlidingPiece

  def symbol
    '/u2657'.encode('utf-8')
  end

  def move_dirs
    [:top_left, :top_right, :bottom_left, :bottom_right]
  end
end
