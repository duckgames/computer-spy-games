' QB64 adaptation of 'Spy Eyes' from Usborne Publishing's 'Computer Spy Games' available here: https://usborne.com/browse-books/features/computer-and-coding-books/
' Adapted by Kevin Church (https://github.com/duckgames/)

10 DIM X(9): DIM Y(9)
20 LET P = 0
30 FOR I = 1 TO 9
    40 GOSUB 340: LET X(I) = N + 3
    50 GOSUB 340: LET Y(I) = N + 3
60 NEXT I
70 GOSUB 360
80 GOSUB 310
90 GOSUB 340
100 LET M = N: GOSUB 340
110 LET X(M) = X(M) + SGN(N - 5.1)
120 GOSUB 360
130 GOSUB 310
140 CLS: PRINT
150 PRINT "WHICH NUMBER MOVED?"
160 INPUT A
170 IF A <> M THEN GOTO 250
180 CLS: PRINT
190 PRINT "WELL SPIED!"
200 LET P = P + 1
210 PRINT "YOU NOW HAVE"; P; "POINTS"
220 PRINT: PRINT "PRESS A KEY"
230 GOSUB 310
240 GOTO 30
250 CLS: PRINT: PRINT "WRONG - END OF GO"
260 PRINT "CORRECT ANSWER WAS"; M
270 PRINT "YOU SCORED"; P; "POINTS"
280 PRINT "ANOTHER GO? (Y/N)"
290 INPUT A$: IF A$ = "Y" THEN RUN
300 STOP
310 LET I$ = INKEY$
320 IF I$ = "" THEN GOTO 310
330 RETURN
340 RANDOMIZE TIMER ' Seed the random number generator so the game isn't identical each time
341 LET N = INT(RND(1) * 9) + 1
350 RETURN
360 CLS
370 FOR I = 1 TO 9
    380 PRINT TAB(X(I) + 32 * Y(I)); STR$(I) ' QB64 doesn't support the TAB statement with row, column parameters used in the original, 32 * Y(I) adjusts for the column
390 NEXT I
400 RETURN
