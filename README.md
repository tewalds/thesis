# Timo Ewalds' Havannah Thesis
This is the website for Timo Ewalds' Masters thesis from 2012.

[Playing and Solving Havannah](Ewalds_Timo_Spring2012.pdf) - The thesis in pdf form.

## The code:

The code is all open source:

- [Castro](https://github.com/tewalds/castro/) is the Havannah player, with [Morat](https://github.com/tewalds/Morat/) being a generalization to play more games.
- [ParamLog](https://github.com/tewalds/ParamLog/) is a distributed testing framework.

## Proof Trees

Proof trees are posted below. They include all states in the proof tree that took more than some number of
simulations to solve. The higher the threshold, the fewer nodes, and the samller the size,
but the more work it would be to confirm. They are in hgf/sgf format, and can be
opened by HavannahGui (assuming you have enough memory).

- [size4-10000000000.hgf.bz2 (1.1kB)](proof/size4-10000000000.hgf.bz2) - [size4-10000000000.hgf (5.7kB)](proof/size4-10000000000.hgf)
- [size4-1000000000.hgf.bz2 (3.5kB)](proof/size4-1000000000.hgf.bz2) - [size4-1000000000.hgf (24.2kB)](proof/size4-1000000000.hgf)
- [size4-100000000.hgf.bz2 (27.8kB)](proof/size4-100000000.hgf.bz2) - [size4-100000000.hgf (251kB)](proof/size4-100000000.hgf)
- [size4-10000000.hgf.bz2 (245kB -> 2.5MB)](proof/size4-10000000.hgf.bz2)
- [size4-1000000.hgf.bz2 (2.1MB -> 25MB)](proof/size4-1000000.hgf.bz2)
- [size4-100000.hgf.bz2 (18MB -> 223MB)](proof/size4-100000.hgf.bz2)
