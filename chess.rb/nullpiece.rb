require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def symbol
    "   "
  end

  def to_s
    ' _ '
  end

end

if __FILE__ == $PROGRAM_NAME
  null = NullPiece.instance
  p null
end
