require_relative 'stepping_piece'

class Knight

  include SteppingPiece

  def symbol
    '/u2658'.encode('utf-8')
  end

  def move_dirs
    [:NNW, :NNE, :WNW, :ENE, :SSW, :SSE, :ESE, :WSW]
  end

end
