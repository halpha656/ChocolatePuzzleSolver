# 箱詰め問題の探索をするクラス
# @pieces: 使用するピースの配列
# @board: 盤面
# @solutions: 得られた解(盤面)を格納
# @treesize: 再帰メソッドの呼び出し回数(探索木の大きさ)

require './PolyominoBoard.rb'
require './PolyominoPiece.rb'

class PolyominoSolver
    
    def initialize(row, column)
    
        @pieces = []
        @board = PolyominoBoard.new(row, column)
        @solutions = []
        @treesize = 0
        
    end
    
    attr_reader :solutions
    
    # 問題が解けるかどうか判断(サイズ基準)
    def solvable
        boardsize = @board.truesize
        piecesize = 0
        @pieces.each { |piece|
            piecesize += piece.size
        }
        return boardsize == piecesize
    end
    
    # ピースを追加
    def add_piece(piece)
        @pieces << piece
    end
    
    # 解をランダムにk個選んで表示
    def display_solution(k)
        if RUBY_VERSION == "1.8.7"
            k.times{
                @solutions.choice.display_txt
            }
        else
            samples = @solutions.sample(k)
            samples.each {|solution|
                solution.display_txt
            }
        end
    end
    
    # 探索
    def solve
        if !solvable
            puts "The problem is unsolvable"
        else
            solve_iter(nil)
            puts "Finished. Total number of solutions: #{@solutions.length} Tree size: #{@treesize}"
        end
    end
    
    protected
    
    # 探索の再帰処理
    # last_piece: 最後に置いたピース
    def solve_iter(last_piece)
        
        @treesize += 1
        n = @board.smallest_blank
        
        # 盤面が満たされているかどうかの判定, 満たされていたら解を表示
        if n == -1
            print "SOLUTION FOUND"
            @board.display_txt
            @solutions << @board.clone
            #gets
        # 盤面に孤立した空きがあったら探索打ち切り
        elsif !@board.isolated
            @pieces.each{ |piece|

                if !piece.used
                    piece.pattern.times { |i|
                        if @board.check(piece, i, n)
                            @board.place_piece(piece, i, n)
                            #puts "PLACE: #{piece.id}, #{i} to #{n}"
                            solve_iter(piece)
                        end
                    }
                end
            }
        end
        
        if last_piece == nil
            # 探索終了
            return 0
        else
            @board.remove_piece(last_piece)
            #puts "REMOVE: #{last_piece.id}"  
        end
    end
    
end

