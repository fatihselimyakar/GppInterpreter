***USER GUIDE***

To use these interpreter(or parser), follow these instructions:

1-
a)For clisp interpreter: Run the program like this: "clisp gpp_interpreter.lisp"
b)For yacc parser:  Create c file from flex code like this: "lex gpp_interpreter.l"
		    Create c file from yacc cıde like this: "yacc -d gpp_interpreter.y"
		    Compile c files like this: "gcc lex.yy.c y.tab.c -w -lm"
		    Run the program like this: "./a.out"

2-Dollar sign($) should come to screen.

3-Then if you want run file interpreter(or parser) you should enter "g++ <filename>.g++" 
or if you want run terminal interpreter(or parser) you should enter only "g++"

4-If your choice is terminal interpreter(or parser) then you can enter the lexeme pattern whatever you want line by line (if you want exit you can use "(exit)" command in terminal interpreter(or parser) ) or if your choice is file interpreter(or parser), the program will start and finish interpreter(or parser).

Note:If there are not (exit) command at the end of the file(ex. "sample.g++"), the yacc code enters infinite loop, be careful these.

In the lisp code, I used to the implicit parse tree(not implement actual parse tree but behavior is same) that use recursion.