NB. Problem 12: Highly divisible triangular number

NB. Factors, e.g. of 10.
(#~ (0: = |&10)) >:i.10         NB. => 1 2 5 10

NB. Playful and wasteful alternative.
(0: = |)"1 0~ >:i.20            NB. Divisibility table!
{: (0: = |)"1 0~ >:i.20         NB. => 1 2 4 5 10 20

m=: {: @: ((0: = |)"1 0~)
(#~ m) >:i.20                   NB. => 1 2 4 5 10 20
NB. TODO ">:i." should be part of the function, not the data

triangle=: +/@:>:@:i."0
triangle >:i.7                  NB. => 1 3 6 10 15 21 28

seq=: >:@:i."0
factors=: (0: = (|~ seq)) # seq
numdiv=: $@:factors

NB. TODO ...
