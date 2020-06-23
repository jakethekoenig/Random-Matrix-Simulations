-- This file contains various methods to produce random matrices.

-- Sum of random permutation matrices.
randperm  = n -> random (toList (1..n))
cycleperm = (n,a) -> join(drop(toList (1..n), a), take(toList (1..n), a))
perm2matrix = p -> matrix(for i from 0 to #p-1 list toList(insert(p#i-1, 1, (#p-1):0)))
randPermMatrix = n-> perm2matrix (randperm n)
sumOfPerms = (n,d)-> fold(plus, for i from 1 to d list (randPermMatrix n)) - d*id_(ZZ^n)
augmented = (n,d)-> sumOfPerms(n,d)|matrix(toList(insert(0,{1},(n-1):{0})))

-- Function which returns random integer 1 with probability q otherwise 0
bern = (q) -> (if (random(ZZ/q)) == 0 then 1 else 0)
unif = (q) -> (random(ZZ/q))


-- iid n,m matrix with entries given by r. E.g. ()->bern(q)
iid = (n,m,r) -> matrix(for i from 1 to n list (for j from 1 to m list (r())))

-- Returns the Laplacian of a circulent matrix.
circulent = (a,b,n) -> 4 * id_(ZZ^n) - perm2matrix(cycleperm (n,a)) - perm2matrix(cycleperm(n,b)) - perm2matrix(cycleperm(n,n-a))- perm2matrix(cycleperm(n,n-b))

-- Returns the Laplacian of a random bipartite graph with |L| = n, |R| = m and probability q 
-- of each edge being included.
columncount = (M) -> diagonalMatrix (matrix({(for i from 1 to (rank target M) list 1)}) * M)
bipartite = (n,m,q) -> (A=iid(n,m,()->bern(q)); (columncount(transpose(A))|A)||(transpose(A)|columncount(A)))

-- A matrix with zeros on the diagonal and elements distributed by r on the "k wide" diagonal.
neardiag = (n,k,r) -> matrix(for i from 1 to n list (for j from 1 to n list (if abs(i-j)<k then r() else 0)))
