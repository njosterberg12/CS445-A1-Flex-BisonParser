%{
// preamble: C code goes here
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int line=1;

%}

%option noyywrap

%%
"int" {printf("LINE %i Token: INT\n",line);}
"bool" {printf("LINE %i Token: BOOL\n",line);}
"static" {printf("LINE %i Token: STATIC\n",line);}
"char" {printf("LINE %i Token: CHAR\n",line);}
"true" {printf("LINE %i Token: BOOLCONST Value: 1 Input: %s",line,yytext);}
"false" {printf("LINE %i Token: BOOLCONST Value: 0 Input: %s",line,yytext);}
"and" {printf("LINE %i Token: AND\n",line);}
"or"  {printf("LINE %i Token: OR\n",line);}
"if"  {printf("LINE %i Token: IF\n",line);}
"then" {printf("LINE %i Token: THEN\n",line);}
"not" {printf("LINE %i Token: NOT\n",line);}
"elseif" {printf("LINE %i Token: ELSIF\n",line);}
"else" {printf("LINE %i Token: ELSE\n",line);}
"break" {printf("LINE %i Token: BREAK\n",line);}
"while" {printf("LINE %i Token: WHILE\n",line);}
"do" {printf("LINE %i Token: DO\n",line);}
"return" {printf("LINE %i Token: RETURN\n",line);}
"loop" {printf("LINE %i Token: LOOP\n",line);}
"forever" {printf("LINE %i Token: FOREVER\n",line);}
'[a-z]'|'[A-Z]'|'\x'|'.' {printf("LINE %i Token: CHARCONST Value: %s Input: %s\n",line,yytext,yytext);}
\"[a-zA-Z]+\" {printf("LINE %i Token: STRINGCONST Value: %s Input: %s\n",line,yytext,yytext);}
[a-zA-Z]+ {printf("LINE %i Token: ID Value: %s\n",line,yytext);}
-?([1-9][0-9]*|0) {printf("LINE %i Token: NUMCONST Value: %s Input: %s\n",line,yytext,yytext);}
"=="  {printf("LINE %i Token: EQ\n",line);}
"++"  {printf("LINE %i Token: INC\n",line);}
"--"  {printf("LINE %i Token: DEC\n",line);}
"+="  {printf("LINE %i Token: ADDASS\n",line);}
"-="  {printf("LINE %i Token: SUBASS\n",line);}
">="  {printf("LINE %i Token: GRTEQ\n",line);}
"<="  {printf("LINE %i Token: LESSEQ\n",line);}
"!="  {printf("LINE %i Token: NOTEQ\n",line);}
"/="  {printf("LINE %i Token: DIVASS\n",line);}
"*="  {printf("LINE %i Token: MULASS\n",line);}
".."  {printf("LINE %i Token: RANGE\n",line);}
[//.] {line;}
"<"|">"|"("|")"|"{"|"="|";"|","|":"|"*"|"+"|"%"|"/"|"-"|"["|"]"|"}"		{printf("LINE %i Token: %s\n",line,yytext);}
.			{line;}
\n 			{line++;}
%%

int main()
{
   yylex();
   return 0;
}
