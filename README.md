# Random-Matrix-Simulations
A place simulations having to do with Random Matrix Theory and the Abelian Sandpile.

It's just a stub right now with some pretty pictures of the abelian sandpile on the plane.

# macaulay2 code

This is some code I write earlier for the purposes of doing monte carlo simulations to determine the probability random permutation matrices and sums of permutation matrices were surjective. The idea is experiment.m2 has code that's helpful for running experiments: monte_carlo runs a random function trials many times to estimate a probability. experiment runs monte_carlo many times over a range of n. props.m2 has code which determines a property of a matrix. Right now just surjectivity.

RMT.m2 has code that produces matrices. The only code in the directory relevant to us right now is circulent which makes the laplacian of a specified circulent graph. You can compute the smithnormalform using macaulay2's smithNormalForm function.
TODO: Make the code general for a larger list of a_i
TODO: Do this in python with Sage instead.
TODO: Circulent doesn't work if b is too large relative to n. In the case of a,b = 1,3 need n>=7. Fix this.
