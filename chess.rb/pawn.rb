require_relative 'stepping_piece'
require_relative 'piece'
require 'byebug'

class Pawn < Piece

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

  def move_dirs
    moves = []
    if @color == :white
      moves += [:left, :right, :down, :down_down, :bottom_left, :bottom_right]
    else
      moves += [:left, :right, :up, :up_up, :top_left, :top_right]
    end

    if at_start_row?
      moves.delete(:down_down)
      moves.delete(:up_up)
    end

    moves
  end

  def at_start_row?
    [1, 6].include?(@current_pos[0])
  end

  def symbol
    if @color == :white
      " \u2659 ".encode('utf-8')
    else
      " \u265F ".encode('utf-8')
    end
  end


end

if __FILE__ == $PROGRAM_NAME
  pawn = Pawn.new([2,0], :white)
  p pawn.moves
end
