


class Piece
  # include SteppingPiece
  attr_reader :current_pos

  MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0],
    top_left: [-1, -1],
    top_right: [-1, 1],
    bottom_left: [1, -1],
    bottom_right: [1, 1],
    NNW: [-2, -1],
    NNE: [-2, 1],
    WNW: [-1, -2],
    ENE: [-1, 2],
    SSW: [2, -1],
    SSE: [2, 1],
    ESE: [1, 2],
    WSW: [1, -2]
  }

  def initialize(current_pos)
    @current_pos = current_pos
  end

  def symbol
    " \u2656 ".encode('utf-8')
  end

  def to_s
    " X "
  end

  def moves
    #array of possible moves
  end

end
