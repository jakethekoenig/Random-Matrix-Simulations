load "experiment.m2"

calcEV = (dist) -> sum(elements(dist))/#elements(dist)

bipartitePrimeRng = (args, trials, start, end) -> experiprint((i -> if isPrime(i) then ran_mc(reducedbipartite, M->corank(M,i), args, trials)),(seq -> if seq#1 =!= null then (print seq; print numeric_50(calcEV(seq#1)))), start, end)

bipartiteVertRnga1 = (p, trials, startVert, endVert, spread, startPrime, endPrime) -> experiprint((i -> if mod(i-startVert,spread) == 0 then (print concatenate("vertices: ", toString(i)); bipartitePrimeRng((i,i,p), trials, startPrime, endPrime))), (seq -> if seq#1 =!= null then print seq), startVert, endVert)

bipartiteVertRng = (p, trials, n, startVert, endVert, spread, startPrime, endPrime) -> experiprint((i -> if mod(i-startVert,spread) == 0 then (print concatenate("vertices: ", toString(i)); bipartitePrimeRng((n,i,p), trials, startPrime, endPrime))), (seq -> if seq#1 =!= null then print seq), startVert, endVert)



