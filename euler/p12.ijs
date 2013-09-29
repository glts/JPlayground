NB. Problem 12: Highly divisible triangular number

NB. Factors, e.g. of 10.
(#~ (0: = |&10)) >:i.10         NB. => 1 2 5 10

NB. Playful and wasteful alternative.
(0: = |)"1 0~ >:i.20            NB. Divisibility table!
{: (0: = |)"1 0~ >:i.20         NB. => 1 2 4 5 10 20

m=: {: @: ((0: = |)"1 0~)
(#~ m) >:i.20                   NB. => 1 2 4 5 10 20
NB. TODO ">:i." should be part of the function, not the data

NB. TODO ...
