NB. Problem 1: Multiples of 3 and 5

NB. This can still become simpler, can it not?

NB. TODO how to *filter*? how to express "x mod 3 == 0"?
divby3=: (=&0) @: (3&|)
(#~ divby3) >:i.9       NB. => 3 6 9
divby5=: (=&0) @: (5&|)
(#~ divby5) >:i.9       NB. => 5

+/ ~. ((#~ divby3) , (#~ divby5)) >:i.999
                        NB. => 233168

divby3or5=: 0&= @: (3&| <. 5&|)
+/ (#~ divby3or5) >:i.999

NB. Terser. Multiples of 3 and 5 by way of a 6-train:
threesfives=: #~ 0: = 3&| <. 5&|
+/ threesfives }.i.1000
                        NB. => 233168

NB. ... and the one-liner, if you're so inclined :)
+/ (#~ 0: = 3&| <. 5&|) }.i.1000
