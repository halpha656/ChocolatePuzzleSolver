# ピースの形状データを保持
# 個々のピースにつき1オブジェクト
# @id: 識別符号 結果表示用に使用
# @pattern: 置き方(対称性により1,2,4,8のいずれか)
# @size: ピースの大きさ
# @used: ピースが盤面に置かれているかどうか(true: 置かれている)
# @shapes: 形状データ(3次元配列)(@pattern種類それぞれについて入力で指定)
#
# @shapesの形式例
# ・形状
#  FF
# FF
#  F
# ・データ
# [[0,0], [0,1], [1,-1], [1,0], [2,0]]
# @shapesはこの2次元配列を置き方の分だけ並べた配列(3次元)
# データのチェックは未実装

class PolyominoPiece
    def initialize(char, data)
        @shapes = data
        @pattern = data.length
        @size = data[0].length
        @id = char
        @used = false
    end
    
    attr_reader :shapes, :pattern, :id, :used, :size
    attr_writer :used
    
    
end