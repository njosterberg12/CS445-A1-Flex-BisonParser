%{
// preamble: C code goes here
#include <stdio.h>
#include "scanType.h"

extern int yylex();
extern int yydebug;

#define YYERROR_VERBOSE
void yyerror(const char *msg)
{
   printf("ERROR(PARSER): %s\n", msg);
}
%}

// this is the type of yylval
%union {
   TokenData *tokenData;
}

%token <tokenData> AND OR NOT // logic operators
%token <tokenData> IF THEN ELSE ELSEIF DO WHILE BREAK RETURN LOOP FOREVER // control statements
%token <tokenData> INT BOOL CHAR // data definition words
%token <tokenData> BOOLCONST CHARCONST ID NUMCONST STRINGCONST // literal type
%token <tokenData> STATIC // other words
%token <tokenData> '==' '++' '--' '+=' '-=' '>=' '<=' '!=' '/=' '*=' '..'
%token <tokenData> '<' '>' '(' ')' '{' '}' '=' ';' ',' ':' '*' '+' '%' '/' '-' '[' ']' 
%%
tokenlist : tokenlist token
	  | token
	  ;

token      : AND		{printf("AND 	line: %d\n", $1->linenum);}
	   | OR			{printf("OR 	line: %d\n", $1->linenum);}
	   | NOT		{printf("NOT 	line: %d\n", $1->linenum);}
	   | IF			{printf("IF	line: %d\n", $1->linenum);}
	   | THEN		{printf("THEN	line: %d\n", $1->linenum);}
	   | ELSE		{printf("ELSE	line: %d\n", $1->linenum);}
	   | ELSEIF		{printf("ELSIF	line: %d\n", $1->linenum);}
	   | DO			{printf("DO	line: %d\n", $1->linenum);}
	   | WHILE		{printf("WHILE	line: %d\n", $1->linenum);}
	   | BREAK		{printf("BREAK	line: %d\n", $1->linenum);}
	   | RETURN		{printf("RETURN	line: %d\n", $1->linenum);}
	   | LOOP		{printf("LOOP	line: %d\n", $1->linenum);}
	   | FOREVER		{printf("FOREVERline: %d\n", $1->linenum);}
	   | INT		{printf("INT	line: %d\n", $1->linenum);}
	   | BOOL		{printf("BOOL	line: %d\n", $1->linenum);}
	   | CHAR		{printf("CHAR	line: %d\n", $1->linenum);}
	   | BOOLCONST		{printf("BOOLCONST line: %d Value: %d  Input: %s\n", $1->linenum, $1->nvalue, $1->tokenstr);}
	   | CHARCONST		{printf("CHARCONST line: %d Value: %s  Input: %s\n", $1->linenum, $1->cvalue, $1->tokenstr);}
	   | ID			{printf("ID	line: %d Value: %s\n",$1->linenum, $1->tokenstr);}
	   | NUMCONST		{printf("NUMCONST line: %d Value: %d Input: %d\n", $1->linenum, $1->nvalue, $1->tokenstr);}
	   | STRINGCONST	{printf("STRINGCONST line: %d Value: %s Input: %s\n",$1->linenum, $1->svalue, $1->tokenstr);}
	   | STATIC		{printf("STATIC line: %d\n", $1->linenum);}
	   | '=='               {printf("==	line: %d\n", $1->linenum);}
	   | '++'		{printf("++	line: %d\n", $1->linenum);}	
	   | '--'               {printf("--	line: %d\n", $1->linenum);}
	   | '+='               {printf("+=	line: %d\n", $1->linenum);}
	   | '-='               {printf("-=	line: %d\n", $1->linenum);}
	   | '>='               {printf(">=	line: %d\n", $1->linenum);}
	   | '<='               {printf("<=	line: %d\n", $1->linenum);}
	   | '!='               {printf("!=	line: %d\n", $1->linenum);}
	   | '/='               {printf("/=	line: %d\n", $1->linenum);}
	   | '*='               {printf("*=	line: %d\n", $1->linenum);}
	   | '..'               {printf("..	line: %d\n", $1->linenum);}
	   | '<'                {printf("<	line: %d\n", $1->linenum);}
	   | '>'                {printf(">	line: %d\n", $1->linenum);}
	   | '('                {printf("(	line: %d\n", $1->linenum);}
	   | ')'                {printf(")	line: %d\n", $1->linenum);}
	   | '{'                {printf("{	line: %d\n", $1->linenum);}
	   | '}'                {printf("}	line: %d\n", $1->linenum);}
	   | '='                {printf("=	line: %d\n", $1->linenum);}
	   | ';'                {printf(";	line: %d\n", $1->linenum);}
	   | ','                {printf(",	line: %d\n", $1->linenum);}
	   | ':'                {printf(":	line: %d\n", $1->linenum);}
	   | '*'                {printf("*	line: %d\n", $1->linenum);}
	   | '+'                {printf("+	line: %d\n", $1->linenum);}
	   | '%'                {printf("%	line: %d\n", $1->linenum);}
	   | '/'                {printf("/	line: %d\n", $1->linenum);}
	   | '-'                {printf("-	line: %d\n", $1->linenum);}
	   | '['                {printf("[	line: %d\n", $1->linenum);}
	   | ']'                {printf("]	line: %d\n", $1->linenum);}
	   ;
%%
int main()
{
   // yydebug = 1;
   yyparse();

   return 0;
}

