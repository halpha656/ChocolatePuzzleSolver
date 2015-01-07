# ペントミノ箱詰め問題の探索をするクラス

require './PolyominoSolver.rb'
require './PentominoBox.rb'

class PentominoSolver < PolyominoSolver
    
    def initialize
        @pieces = [] 
        @pieces << PolyominoPiece.new('F', PentominoBox::F) #鏡像・回転解の除去するときはFFFを使用
        #@pieces << PolyominoPiece.new('X', PentominoBox::X)
        @pieces << PolyominoPiece.new('L', PentominoBox::L)
        @pieces << PolyominoPiece.new('N', PentominoBox::N)
        @pieces << PolyominoPiece.new('P', PentominoBox::P)
        @pieces << PolyominoPiece.new('Y', PentominoBox::Y)
        @pieces << PolyominoPiece.new('Z', PentominoBox::Z)
        @pieces << PolyominoPiece.new('T', PentominoBox::T)
        @pieces << PolyominoPiece.new('U', PentominoBox::U)
        @pieces << PolyominoPiece.new('V', PentominoBox::V)
        @pieces << PolyominoPiece.new('W', PentominoBox::W)
        @pieces << PolyominoPiece.new('I', PentominoBox::I)

        
        @board = PolyominoBoard.new(6, 10)
        
        @solutions = []
        @treesize = 0
    end
    
    #Xを左上に配置することで高速化および鏡像解の除去
    def solve
        x = PolyominoPiece.new('X', PentominoBox::X)
        nx = [2, 8, 9, 15, 16, 22, 23]
        nx.each { |n|
            @board.display_txt
            @board.place_piece(x, 0, n)
            solve_iter(nil)
            @board.remove_piece(x)
        }
        puts "Finished. Total number of solutions: #{@solutions.length} Tree size: #{@treesize}"
    end
end

