
bin_mc = (obj, prop, args, trials) -> number(for i from 1 to trials list prop(obj(args)), i->i) 

ran_mc = (obj, prop, args, trials) -> tally for i from 1 to trials list prop(obj(args))

experiment = (testFunc, start, end) -> for i from start to end do (print i; print testFunc(i))

experiprint = (testFunc, printFunc, start, end) -> for i from start to end do (printFunc(i, testFunc(i)))

runMn3 = (n, trials) -> experiment(i -> bin_mc(sumOfPerms, obj -> checkImage(obj, i), (i,3), trials), n)

runMnd = (n, trials, d) -> experiment(i -> bin_mc(sumOfPerms, obj -> checkImage(obj, i), (i,d), trials), n)
