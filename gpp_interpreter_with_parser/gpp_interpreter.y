%{ 
/* Definition section */
#include<stdio.h> 
#include<math.h>

/* Functions */
extern int yylex();
extern int yyparse();
int printList(int list[],int size);
int appendFirst(int list[],int size,int val);

/* Input file pointer */
extern FILE *yyin;

/* Flags */
int flag=0;
int exit_flag=0;
int list_flag=0;
int binary_flag=0;

/* For the lists */
int listValues[999];
int listIndex=0;

/* For the if*/
int holdIndex=0;

%} 
%start START

%token COMMENT
%token AND
%token OR
%token NOT
%token EQUAL
%token LESS
%token NIL
%token LIST
%token APPEND
%token CONCAT
%token SET
%token DEFFUN
%token DEFVAR
%token FOR
%token IF 
%token EXIT 
%token LOAD 
%token FLE
%token DISP
%token TRUE 
%token FALSE
%token PLUS 
%token MINUS
%token DIV
%token MULT
%token OP
%token CP
%token DBLMULT
%token OC
%token CC
%token COMMA
%token NUMBER
%token FLOAT_NUMBER
%token IDENTIFIER
%token LISTOP
%token WHILE

/* Rule Section */
%% 

START:  | INPUT{
        if(!flag && list_flag){
            printf("Syntax OK.\n");
        	printf("Result:"); 
            
            printList(listValues,listIndex); 
            listIndex=0;
            
            holdIndex=0;
            list_flag=0;
        }
        else if(!flag && binary_flag){
			printf("Syntax OK.\n");
            if($$==1)
        	    printf("Result:T",$$);
            else
                printf("Result:NIL",$$);
            binary_flag=0;
		}
        else if(!flag){
			printf("Syntax OK.\n");
        	printf("Result:%d",$$); 
		}
		return 0;
		};

INPUT: EXPI | EXPLISTI | EXPB{ binary_flag=1; }
;

EXPI: OP DEFVAR IDENTIFIER EXPI CP { $$=$4; } 
| OP SET IDENTIFIER EXPI CP { $$=$4; } 
| OP PLUS EXPI EXPI CP { $$=$3+$4; } 
| OP MINUS EXPI EXPI CP { $$=$3-$4; } 
| OP MULT EXPI EXPI CP { $$=$3*$4; } 
| OP DBLMULT EXPI EXPI CP { $$=pow($3,$4); } 
| OP DIV EXPI EXPI CP { $$=$3/$4; } 
| OP IDENTIFIER EXPLISTI CP { 
    $$=$3; 
    list_flag=1;
}
| OP DEFFUN IDENTIFIER IDLIST EXPLISTI CP{
    $$=$5;
    list_flag=1;
}
| OP IF EXPB EXPLISTI CP { 
    $$=$3; 
    if(!$3){
        listIndex=0;
        listValues[0]=NULL;
    }
    list_flag=1;
}
| OP IF EXPB EXPLISTI EXPLISTI CP{ 
    $$=$3;
    if($3){
        listIndex=holdIndex;
    }
    else{
        listIndex=listIndex-holdIndex;
        for(int i=0;i<listIndex;++i){
            listValues[i]=listValues[holdIndex+i];
        }
    }
    list_flag=1;
}
| OP WHILE EXPB EXPLISTI CP{ 
    $$=$3; 
    if(!$3){
        listIndex=0;
        listValues[0]=NULL;
    }
    list_flag=1;
}
| OP FOR OP IDENTIFIER EXPI EXPI CP EXPLISTI CP{
    list_flag=1;
}
| OP LIST VALUES CP{
    $$=1; 
    list_flag=1;
}
| OP EXIT CP {
	exit_flag=1;
	printf("Bye.");
	return 0;
}
| OP LOAD OC FLE OC CP{ $$=1; }
| OP DISP EXPI CP{ $$=1; }
| IDENTIFIER { $$=1; }
| NUMBER { $$=$1; }
| COMMENT { 
    printf("\nCOMMENT"); 
    return 0;
};


EXPB:  OP AND EXPB EXPB CP { $$=$3&&$4; } 
| OP OR EXPB EXPB CP { $$=$3||$4; } 
| OP NOT EXPB CP { $$=!$3; } 
| OP EQUAL EXPB EXPB CP { $$=($3==$4); } 
| OP EQUAL EXPI EXPI CP { $$=($3==$4); } 
| OP LESS EXPI EXPI CP { $$=($3<$4); } 
| BinaryValue{$$=$1;};

EXPLISTI: OP CONCAT EXPLISTI EXPLISTI CP{
    $$=1; 
    list_flag=1;
}
| OP APPEND EXPI EXPLISTI CP{
    $$=1;
    //listValues[listIndex]=$3;
    appendFirst(listValues,listIndex,$3);
    ++listIndex;
    list_flag=1;
}
| LISTVALUE{$$=1;}
;

IDLIST: OP ILIST CP;

ILIST: ILIST IDENTIFIER | IDENTIFIER;

LISTVALUE: LISTOP VALUES CP{
    list_flag=1;
    if(holdIndex==0)
        holdIndex=listIndex;
    //printf("BURDA:%d",holdIndex);
}
| LISTOP CP {
    $$=0;
    list_flag=1;
    listIndex=0;
}
| NIL{$$=0;}
;

VALUES: VALUES NUMBER  {
    listValues[listIndex]=$2;
    ++listIndex;
}
| NUMBER {
    listValues[listIndex]=$1;
    ++listIndex;
}
| NIL{ $$=0; };

BinaryValue: TRUE { $$=1; }
| FALSE { $$=0; };

%% 

//driver code 
int main(int argc, char *argv[]){ 
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
		while(!exit_flag)	
			yyparse();
    }
    //if user input is "g++ <filename>.g++" then starts file lexer.
    else if( (strncmp(input,g,3)==0) && (strlen(input)>3) ){
        for(int i=4;input[i]!='\0';++i){
            filename[i-4]=input[i];
        }
        fp = fopen(filename,"r"); 
        yyin=fp;
		while(!exit_flag)
			yyparse();
    }
    //neither "g++" nor "g++ <filename>.g++" then prints error.
    else{
        printf("Your g++ command is not correct! You can write \"g++\" or \"g++ <filename>.g++\". ");
    }

    return 0; 
}

int yyerror(const char * ch) 
{ 
	printf("\nSYNTAX_ERROR Expression not recognized"); 
    flag=1;
    exit_flag=1;
}

int printList(int list[],int size){
    printf("(");
    for(int i=0;i<size;++i)
        if(i==size-1)
            printf("%d",list[i]);
        else
            printf("%d ",list[i]);
    printf(")");
}

int appendFirst(int list[],int size,int val){
    for(int i=size-1;i>=0;--i){
        list[i+1]=list[i];
    }
    list[0]=val;
}
