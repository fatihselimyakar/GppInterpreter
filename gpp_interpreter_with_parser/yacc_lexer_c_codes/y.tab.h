/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     COMMENT = 258,
     AND = 259,
     OR = 260,
     NOT = 261,
     EQUAL = 262,
     LESS = 263,
     NIL = 264,
     LIST = 265,
     APPEND = 266,
     CONCAT = 267,
     SET = 268,
     DEFFUN = 269,
     DEFVAR = 270,
     FOR = 271,
     IF = 272,
     EXIT = 273,
     LOAD = 274,
     FLE = 275,
     DISP = 276,
     TRUE = 277,
     FALSE = 278,
     PLUS = 279,
     MINUS = 280,
     DIV = 281,
     MULT = 282,
     OP = 283,
     CP = 284,
     DBLMULT = 285,
     OC = 286,
     CC = 287,
     COMMA = 288,
     NUMBER = 289,
     FLOAT_NUMBER = 290,
     IDENTIFIER = 291,
     LISTOP = 292,
     WHILE = 293
   };
#endif
/* Tokens.  */
#define COMMENT 258
#define AND 259
#define OR 260
#define NOT 261
#define EQUAL 262
#define LESS 263
#define NIL 264
#define LIST 265
#define APPEND 266
#define CONCAT 267
#define SET 268
#define DEFFUN 269
#define DEFVAR 270
#define FOR 271
#define IF 272
#define EXIT 273
#define LOAD 274
#define FLE 275
#define DISP 276
#define TRUE 277
#define FALSE 278
#define PLUS 279
#define MINUS 280
#define DIV 281
#define MULT 282
#define OP 283
#define CP 284
#define DBLMULT 285
#define OC 286
#define CC 287
#define COMMA 288
#define NUMBER 289
#define FLOAT_NUMBER 290
#define IDENTIFIER 291
#define LISTOP 292
#define WHILE 293




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

