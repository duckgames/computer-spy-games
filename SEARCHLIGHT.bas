' QB64 adaptation of 'Spy Eyes' from Usborne Publishing's 'Computer Spy Games' available here: https://usborne.com/browse-books/features/computer-and-coding-books/
' Adapted by Kevin Church (https://github.com/duckgames/)

' There are some odd jumps in line number, e.g. 40-60 with no 50. The original code took one line to setup variables, then called
' GOSUB 380 to jump to where the PRINT call was. I've just done it in one line with _PRINTSTRING (QB64 doesn't support PRINT with
' x, y coords) and couldn't be bothered to update all the line numbers!

1 SCREEN 0 'Need to declare SCREEN mode to use _PRINTSTRING
9 DIM A$(7) 'Declaration of data array moved up here from line 450
10 GOSUB 450
20 LET A = 1: LET G = 0: LET S = 0
30 CLS
40 _PRINTSTRING (1, 13), A$(A)
60 LET F = 0: LET N = 0: LET NN = 0: GOSUB 340
70 LET L = 0: LET C = 0: LET TC = 10: LET C1 = 0
80 LET I$ = INKEY$
90 IF I$ = "N" OR I$ = "n" THEN LET NN = N - 1 'Accept lower case input too
100 IF I$ = "M" OR I$ = "m" THEN LET NN = N + 1 'Accept lower case input too
110 IF NN > 19 THEN LET NN = 19
120 IF NN < 0 THEN LET NN = 0
130 IF NN = 10 AND F = 0 THEN LET F = 1
140 IF NN = 0 AND F = 1 THEN LET F = 2
150 GOSUB 340
160 IF N <> NN THEN LET S = S + 1
170 LET N = NN: LET G = G + 1
180 GOSUB 400
190 IF MID$(A$(A), N + 1, 1) = " " AND L = 1 THEN GOTO 240
200 _DELAY 0.1 'Replace empty loop with call to _DELAY
210 IF F < 2 THEN GOTO 80
220 LET A = A + 1: IF A = 8 THEN LET A = 7
230 GOTO 30
240 _PRINTSTRING (5, 1), "YOU HAVE BEEN SEEN"
260 PRINT: PRINT "YOU SCORED"; INT((A - 1 + S / G) * 100)
270 PRINT: PRINT "ANOTHER GO? (Y/N)"
280 INPUT C$: IF C$ = "Y" OR C$ = "y" THEN RUN 'Accept lower case input too
290 PRINT "BYE.....": STOP
300 _PRINTSTRING (11, 4), "*": RETURN
320 _PRINTSTRING (11, 4), " ": RETURN
340 _PRINTSTRING (N + 1, 14), " "
360 _PRINTSTRING (NN + 1, 14), "S": RETURN
390 RETURN
400 IF L = 1 THEN LET C = C + 1
410 IF C = TC THEN LET L = 0: LET C = 0: LET TC = INT(RND(1) * 8 + (12 - A)): GOSUB 320
420 IF L = 0 THEN LET C1 = C1 + 1
430 IF C1 = TC THEN LET L = 1: LET C1 = 0: LET TC = INT(RND(1) * 10 + (8 - A)): GOSUB 300
440 RETURN
'Change loop syntax for QB64
450 FOR I = 1 TO 7
    455 READ A$(I)
460 NEXT
470 RETURN
480 DATA "== = = ==  == = = =="
490 DATA "==  = ==  == =  == ="
500 DATA "=  ==  = =  =   =  ="
510 DATA "=  =  =   =   ==   ="
520 DATA "=   =   = =   =    ="
530 DATA "=    =  =    =   = ="
540 DATA "=   =     =    =   ="
