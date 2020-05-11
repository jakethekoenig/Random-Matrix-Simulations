
monte_carlo = (obj, prop, args, trials) -> number(for i from 1 to trials list prop(obj(args)), i->i) 

experiment = (testFunc, n) -> for i from 1 to n do print testFunc(i)

runMn3 = (n, trials) -> experiment(i -> monte_carlo(sumOfPerms, obj -> checkImage(obj, i), (i,3), trials), n)

runMnd = (n, trials, d) -> experiment(i -> monte_carlo(sumOfPerms, obj -> checkImage(obj, i), (i,d), trials), n)
