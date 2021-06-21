
bin_mc = (obj, prop, args, trials) -> number(for i from 1 to trials list prop(obj(args)), i->i) 

ran_mc = (obj, prop, args, trials) -> tally for i from 1 to trials list prop(obj(args))

experiment = (testFunc, start, end) -> for i from start to end do (print i; print testFunc(i))

experiment2 = (testFunc, lis) -> for i in lis do (print i; print testFunc(i))

runMn3 = (n, trials) -> experiment(i -> bin_mc(sumOfPerms, obj -> checkImage(obj, i), (i,3), trials), n)

runMnd = (n, trials, d) -> experiment(i -> bin_mc(sumOfPerms, obj -> checkImage(obj, i), (i,d), trials), n)

-- Determines the empirical distribution of corank for reduced Laplacian of bipartite graph.
primes = {2,3,5,7,11,13} -- TODO: best way to enumerate primes in macaulay?
dipartiteexp = (n, primes, trials) -> experiment2(i ->ran_mc(di_bipartite, obj -> corank(obj, i), (n,n,2),trials), primes)
