class TetrominoBox

    l0 = [[0,0], [0,1], [0,2],[1,0]]
    l1 = [[0,0], [0,1], [1,1], [2,1]]
    l2 = [[0,0], [1,-2], [1,-1], [1,0]]
    l3 = [[0,0], [1,0], [2,0], [2,1]]
    l4 = [[0,0], [0,1], [1,0], [2,0]]
    l5 = [[0,0], [0,1], [0,2], [1,2]]
    l6 = [[0,0], [1,0], [2,-1], [2,0]]
    l7 = [[0,0], [1,0], [1,1], [1,2]]
    L = [l0, l1, l2, l3, l4, l5, l6, l7]

    s0 = [[0,0], [0,1], [1,1], [1,2]]
    s1 = [[0,0], [1,-1], [1,0], [2,-1]]
    s2 = [[0,0], [0,1], [1,-1], [1,0]]
    s3 = [[0,0], [1,0], [1,1], [2,1]]
    S = [s0, s1, s2, s3]

    t0 = [[0,0], [0,1], [0,2], [1,1]]
    t1 = [[0,0], [1,-1], [1,0], [2,0]]
    t2 = [[0,0], [1,-1], [1,0], [1,1]]
    t3 = [[0,0], [1,0], [1,1], [2,0]]
    T = [t0, t1, t2, t3]

    i0 = [[0,0], [0,1], [0,2], [0,3]]
    i1 = [[0,0], [1,0], [2,0], [3,0]]
    I = [i0, i1]

    o0 = [[0,0], [0,1], [1,0], [1,1]]
    O = [o0]


    tl0 = [[0,0], [1,0], [1,1]]
    tl1 = [[0,0], [0,1], [1,0]]
    tl2 = [[0,0], [0,1], [1,1]]
    tl3 = [[0,0], [1,-1], [1,0]]
    Ltr = [tl0, tl1, tl2, tl3]


    ti0 = [[0,0], [1,0], [2,0]]
    ti1 = [[0,0], [0,1], [0,2]]
    Itr = [ti0, ti1]

    d0 = [[0,0], [0,1]]
    d1 = [[0,0], [1,0]]
    Do = [d0, d1]

    m0 = [[0,0]]
    Mo = [m0]
    
end