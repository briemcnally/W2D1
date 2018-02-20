module SteppingPiece



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
    if Board.valid_pos?(new_pos)
      moves << new_pos
    end

    moves
  end

  def next_move(current_pos, move)
    [current_pos[0] + move[0], current_pos[1] + move[1]]
  end

end
