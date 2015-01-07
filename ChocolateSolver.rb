# チョコレート箱詰め問題の探索をするクラス

require './PolyominoSolver.rb'
require './ChocolateBox.rb'

class ChocolateSolver < PolyominoSolver
    
    def initialize
        @pieces = []     
        @pieces << PolyominoPiece.new('L', ChocolateBox::L)
        @pieces << PolyominoPiece.new('N', ChocolateBox::N)
        @pieces << PolyominoPiece.new('Y', ChocolateBox::Y)
        @pieces << PolyominoPiece.new('T', ChocolateBox::T)
        @pieces << PolyominoPiece.new('U', ChocolateBox::U)
        @pieces << PolyominoPiece.new('F', ChocolateBox::F)
        @pieces << PolyominoPiece.new('X', ChocolateBox::X)
        @pieces << PolyominoPiece.new('J', ChocolateBox::J)
        @pieces << PolyominoPiece.new('W', ChocolateBox::W)
        @pieces << PolyominoPiece.new('C', ChocolateBox::C)
        @pieces << PolyominoPiece.new('S', ChocolateBox::S)

        
        @board = PolyominoBoard.new(6, 11)
        
        @solutions = []
        @treesize = 0
    end
end
