%{
// preamble: C code goes here
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int line=1;

static int setValue(int linenum, int tokenClass, char *svalue)
{
   // create the pass-back data space
   yylval.tokenData = new TokenData;
   
   // stuff it up
   yylval.tokenData->linenum = linenum;
   yylval.tokenData->tokenstr = strdup(svalue); // duplicating string
   yylval.tokenData->numValue = atof(svalue);

   if (tokenClass == ID)
   {
      yylval.tokenData->idIndex = svalue[0]-'a';
   }
   // return the tokenclass
   return tokenClass;
}

%}

%option noyywrap

%%
"int" {printf("INT\n",line);}
"bool" {printf("BOOL\n",line);}
"static" {printf("LINE %i Token: STATIC\n",line);}
"char" {printf("CHAR\n",line);}

"true" {return setValue(line, ;}
"false" {;}

"and" {printf("AND\n",line);}
"or"  {printf("OR\n",line);}
"if"  {printf("IF\n",line);}
"then" {printf("THEN\n",line);}
"not" {printf("NOT\n",line);}
"elseif" {printf("ELSIF\n",line);}
"else" {printf("ELSE\n",line);}
"break" {printf("BREAK\n",line);}
"while" {printf("WHILE\n",line);}
"do" {printf("DO\n",line);}
"return" {printf("RETURN\n",line);}
"loop" {printf("LOOP\n",line);}
"forever" {printf("FOREVER\n",line);}

'[a-z]'|'[A-Z]'|'\x'|'.' {printf("CHARCONST Value: %s Input: %s\n",line,yytext,yytext);}
\"[a-zA-Z]+\" {printf("STRINGCONST Value: %s Input: %s\n",line,yytext,yytext);}
[a-zA-Z]+ {printf("ID Value: %s\n",line,yytext);}
-?([1-9][0-9]*|0) {printf("NUMCONST Value: %s Input: %s\n",line,yytext,yytext);}

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
