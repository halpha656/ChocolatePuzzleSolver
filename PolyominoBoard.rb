# ポリオミノ箱詰め問題の盤面
# @c: 短い1辺の長さ+1(壁の分)
# @r: 長い1辺の長さ+1
# @size: 探索空間の大きさ
# @status: 盤面の状況 0:空 他:満

class PolyominoBoard

    def initialize(row, column)
    
        @c = [row, column].min + 1
        @r = [row, column].max + 1
        @size = @c * @r
        @status = Array.new(@size,0)
        
        # 壁の設定(壁のID:1)
        @r.times{ |i|
            @status[@c*(i+1)-1] = 1
        }
        @c.times{ |i|
            @status[@size-i-1] = 1
        }
        
         
    end
    
    attr_reader :r, :c, :size
    
    # n位置を壁にする
    def set_wall(n)
        if n != 0
            raise "Pixel is not empty"
        else
            @status[n] = 1
        end
    end
    
    # 盤面の大きさ。解けるかどうかのチェックに使用
    def truesize
         (@r-1) * (@c-1)
    end
    
    # 孤立した空きがあるかどうかを判定
    def isolated
        @size.times { |i|
            if @status[i] == 0 && (@status[i+1] != 0 && @status[i-1] != 0 && @status[i-@c] != 0 && @status[i+@c] != 0)
                return true
            end
        }
        return false
    end
    
    # n位置にpieceをdirの方向に置けるか判定 置ける:true 置けない:false
    def check(piece, dir, n)
        shape = piece.shapes[dir]
        chk = 0
        shape.each {|ij|
            k = ij[0] * @c + ij[1]
            if @status[k+n] != 0
            chk += 1 
            end
        }
        chk == 0
    end
    
    # n位置にpieceをdirの方向に置く
    def place_piece(piece, dir, n)
    
        if !check(piece, dir, n)
            raise "Can't place piece: #{piece.id}"
        elsif piece.used
            raise "Piece is already used: #{piece.id}"
        else
            piece.shapes[dir].each {|ij|
                k = ij[0] * @c + ij[1]
                @status[k+n] = piece.id
            }            
            piece.used = true
        end
    end 
    
    # 置いたピースを除去 すこしらんぼう
    def remove_piece(piece)
        if !piece.used
            puts "Piece is not used: #{piece.id}"
        else
            @size.times { |i|
                if @status[i] == piece.id
                    @status[i] = 0
                end
            }
            piece.used = false
        end
    end
    
    # 最も若い空きの位置を返す もし全て埋まっていたら-1
    def smallest_blank
        @size.times { |i|
            if @status[i] == 0
            return i
            end
        }
        return -1
    end
    
    # 結果表示用
    def display_txt
        @size.times{ |i|
            if i % @c == 0
                print "\n"
            end
            print " #{@status[i]}"
        }
        print "\n"
    end
    
        
    # 盤面の複製。結果保存に使用
    def clone
        ret = PolyominoBoard.new(self.r-1,self.c-1)
        ret.status = self.status.clone
        return ret
    end
    
    protected
    
    attr_accessor :status

end      

def test
    require './TetriminoBox'
    require './PolyominoPiece'
    b = PolyominoBoard.new(2,3)
    d1 = PolyominoPiece.new("D",TetriminoBox::Do)
    d2 = PolyominoPiece.new("E",TetriminoBox::Do)
    d3 = PolyominoPiece.new("F",TetriminoBox::Do)
    p b.truesize
    b.display_txt
    p b.smallest_blank 
    b.place_piece(d1,0,0)
    b.place_piece(d2,0,3)
    b.display_txt
    p b.smallest_blank 
    b.remove_piece(d2)
    b.display_txt
    b.place_piece(d2,1,3)
    b.display_txt
    p b.smallest_blank 
    b.place_piece(d3,1,4)
    b.display_txt
    p b.smallest_blank 
    p b.check(d3,0,1)
end