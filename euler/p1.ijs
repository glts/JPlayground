NB. Problem 1: Multiples of 3 and 5

NB. Struggling. This should be much simpler.

NB. TODO how to *filter*? how to express "x mod 3 == 0"?
divby3=: (=&0) @: (3&|)
(divby3 >:i.9) # (>:i.9)
                        NB. => 3 6 9    NB. XXX terrible!
(#~ divby3) >:i.9
                        NB. => 3 6 9    NB. Better.

divby5=: (=&0) @: (5&|)
(#~ divby5) >:i.9
                        NB. => 5

threes=: (#~ divby3) >:i.9
fives=: (#~ divby5) >:i.9
+/ ~. threes, fives
                        NB. => 23

+/ ~. ((#~ divby3) , (#~ divby5)) >:i.999
                        NB. => 233168
