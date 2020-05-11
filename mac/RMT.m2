
randperm  = n -> random (toList (1..n))
cycleperm = (n,a) -> join(drop(toList (1..n), a), take(toList (1..n), a))
perm2matrix = p -> matrix(for i from 0 to #p-1 list toList(insert(p#i-1, 1, (#p-1):0)))
randPermMatrix = n-> perm2matrix (randperm n)
sumOfPerms = (n,d)-> fold(plus, for i from 1 to d list (randPermMatrix n)) - d*id_(ZZ^n)
augmented = (n,d)-> sumOfPerms(n,d)|matrix(toList(insert(0,{1},(n-1):{0})))

sp = n -> image(matrix(insert(0, toList((n-1):1), for i from 0 to n-2 list toList(insert(i, -1, (n-2):0)))))

checkImage = (m,n) -> image(m) == sp(n)

-- Returns the Laplacian of a circulent matrix.
circulent = (a,b,n) -> 4 * id_(ZZ^n) - perm2matrix(cycleperm (n,a)) - perm2matrix(cycleperm(n,b)) - perm2matrix(cycleperm(n,n-a))- perm2matrix(cycleperm(n,n-b))
