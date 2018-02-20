require_relative 'stepping_piece'

class King

  include SteppingPiece

  def symbol
    '/u2654'.encode('utf-8')
  end

  def move_dirs
    [:left, :right, :up, :down]
  end
end
