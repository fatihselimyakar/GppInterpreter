/***********************************************/
/**  341 Programming Languages HW2-Part1      **/
/**  Fall 2019                                **/
/**  Author: Fatih Selim Yakar                **/
/**  No: 161044054                            **/
/***********************************************/

/*** Definition Section has one variable which can be accessed inside yylex() and main() ***/
%{ 
    int c_count = 0; // for open " and close "
    //KEYWORDS
    #define AND "KW_AND"
    #define OR "KW_OR"
    #define NOT "KW_NOT"
    #define EQUAL "KW_EQUAL"
    #define LESS "KW_LESS"
    #define NIL "KW_NIL"
    #define LIST "KW_LIST"
    #define APPEND "KW_APPEND"
    #define CONCAT "KW_CONCAT"
    #define SET "KW_SET"
    #define DEFFUN "KW_DEFFUN"
    #define FOR "KW_FOR"
    #define IF "KW_IF"
    #define EXIT "KW_EXIT"
    #define LOAD "KW_LOAD"
    #define DISP "KW_DISP"
    #define TRUE "KW_TRUE"
    #define FALSE "KW_FALSE"

    //OPERATORS
    #define PLUS "OP_PLUS"
    #define MINUS "OP_MINUS"
    #define DIV "OP_DIV"
    #define MULT "OP_MULT"
    #define OP "OP_OP"
    #define CP "OP_CP"
    #define DBLMULT "OP_DBLMULT"
    #define OC "OP_OC"
    #define CC "OP_CC"
    #define COMMA "OP_COMMA"

    //VALUES,COMMENTS,IDENTIFIERS
    #define VALUE "VALUE"
    #define COMMENT "COMMENT"
    #define ID "IDENTIFIER"
%}

COMMENT ";;".*
LIMITED_VALUE [1-9][0-9]*|"0"
IDENTIFIER [a-zA-Z][a-zA-Z0-9]*
FLOATING_POINT [0-9]+"."[0-9]*
EXIT "(exit)"

%% 
{EXIT} {printf("%s\n",OP);
    printf("%s\n",EXIT);
    printf("%s\n",CP);
    return 0;}
{COMMENT} {printf("%s\n",COMMENT);}
and {printf("%s\n",AND);}
or {printf("%s\n",OR);}
not {printf("%s\n",NOT);}
equal {printf("%s\n",EQUAL);}
less {printf("%s\n",LESS);}
nil {printf("%s\n",NIL);}
list {printf("%s\n",LIST);}
append {printf("%s\n",APPEND);}
concat {printf("%s\n",CONCAT);}
set {printf("%s\n",SET);}
deffun {printf("%s\n",DEFFUN);}
for {printf("%s\n",FOR);}
if {printf("%s\n",IF);}
exit {printf("%s\n",EXIT);}
load {printf("%s\n",LOAD);}
disp {printf("%s\n",DISP);}
true {printf("%s\n",TRUE);}
false {printf("%s\n",FALSE);}
"+" {printf("%s\n",PLUS);}
"-" {printf("%s\n",MINUS);}
"/" {printf("%s\n",DIV);}
"*" {printf("%s\n",MULT);}
"(" {printf("%s\n",OP);}
")" {printf("%s\n",CP);}
"**" {printf("%s\n",DBLMULT);}
"\"" {if(!c_count%2)
        printf("%s\n",OC);
    else
        printf("%s\n",CC);
    ++c_count;}
"," {printf("%s\n",COMMA);}
{LIMITED_VALUE}|{FLOATING_POINT} {printf("%s\n",VALUE);}
{IDENTIFIER} {printf("%s\n",ID);}
" "|"\t"|"\n" { } 
.	 {printf("SYNTAX ERROR %s IS NOT RECOGNIZED",yytext); return 0;} 
%% 

/*** Code Section prints the number of capital letter present in the given input***/
int yywrap(){} 
int main(int argc, char *argv[]){ 
    // Explanation: 
    // yywrap() - wraps the above rule section 
    /* yyin - takes the file pointer which contains the input*/
    /* yylex() - this is the main flex function which runs the Rule Section*/
    // yytext is the text in the buffer 
    FILE *fp; 
    char filename[50]; //taken file's name
    char input[50]; //for getting user selection
    char g[3]={'g','+','+'}; //for control 

    printf("$");
    scanf("%[^\n]%*c", input);
    //if user input is "g++" then starts interpreter.
    if( (strncmp(input,g,3)==0) && (strlen(input)==3) ){
        yyin=stdin;
        printf(">");
        yylex();
    }
    //if user input is "g++ <filename>.g++" then starts file lexer.
    else if( (strncmp(input,g,3)==0) && (strlen(input)>3) ){
        for(int i=4;input[i]!='\0';++i){
            filename[i-4]=input[i];
        }
        fp = fopen(filename,"r"); 
        yyin=fp;
        yylex();
    }
    //neither "g++" nor "g++ <filename>.g++" then prints error.
    else{
        printf("Your g++ command is not correct! You can write \"g++\" or \"g++ <filename>.g++\". ");
    }

    return 0; 
} 
