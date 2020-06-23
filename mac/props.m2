-- Checks if a matrix is surjective
surj = m -> cokernel id_(source m) == cokernel m

-- Checks if a matrix is surjective mod the all 1s vector.
sp = n -> image(matrix(insert(0, toList((n-1):1), for i from 0 to n-2 list toList(insert(i, -1, (n-2):0)))))
checkImage = (m,n) -> image(m) == sp(n)

-- Corank mod p
corank = (M,p) -> ((rank target M) - rank(promote(M, ZZ/p)))
