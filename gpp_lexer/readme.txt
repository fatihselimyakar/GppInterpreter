***USER GUIDE***

To use these lexers, follow these instructions:

1-
a)For clisp lexer: Run the program like this: "clisp gpp_lexer.lisp"
b)For flex lexer:  Create c file from flex code like this: "lex gpp_lexer.l"
		   Compile c file like this: "gcc lex.yy.c"
		   Run the program like this: "./a.out"

2-Dollar sign($) should come to screen.

3-Then if you want run file lexer you should enter "g++ <filename>.g++" 
or if you want run terminal lexer you should enter only "g++"

4-If your choice is terminal lexer then you can enter the lexeme pattern whatever you want line by line (if you want exit you can use "(exit)" command in terminal lexer) or if your choice is file lexer, the program will start and finish lexer.

Note:The clips lexer does not get only identifier or value(like only <identifier> or only <value>) you must complete with tokens.(like (<identifier>) or "<value>")

***DFA or REGULAR EXPRESSIONS***

I am using both of these regular expressions:

COMMENT ";;".*
LIMITED_VALUE [1-9][0-9]*|"0"
IDENTIFIER [a-zA-Z][a-zA-Z0-9]*
EXIT "(exit)"

Other keywords and operators checked by string matching using defined strings.