NB. Problem 16: Power digit sum

NB. See also the file PowerDigitSum.java.

NB. First attempt.
space=: 4 : 'x , '' '', y'
space/ ": 2^15  NB. => 3 2 7 6 8
+/ ". space/ ": 2^15
                NB. => 26

+/ ". space/ ": 2x^1000
                NB. => 1366
