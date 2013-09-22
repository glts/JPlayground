NB. Problem 6: Sum square difference

NB. Solved with a fork.

(*:@:(+/) - +/@:*:) >:i.100
                        NB. => 25164150

sumsqdiff=: *:@:(+/) - +/@:*:
sumsqdiff >:i.100       NB. => 25164150
sumsqdiff >:i.1000x     NB. => 250166416500
