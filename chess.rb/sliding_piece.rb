require_relative 'piece'

module SlidingPiece
  HORIZONTAL_DIRS = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

  DIAGONAL_DIRS = {
    top_left: [-1, -1],
    top_right: [-1, 1],
    bottom_left: [1, -1],
    bottom_right: [1, 1]
  }

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    diffs = move_dirs.map { |key| Piece::MOVES[key] }

    moves = []
    diffs.each do |diff|
      moves += possible_pos(diff)
    end

    moves
  end

  def possible_pos(move)
    moves = []
    new_pos = next_move(current_pos, move)
    while Board.valid_pos?(new_pos)
      moves << new_pos
      new_pos = next_move(new_pos, move)
    end

    moves
  end

  def next_move(current_pos, move)
    [current_pos[0] + move[0], current_pos[1] + move[1]]
  end
end
