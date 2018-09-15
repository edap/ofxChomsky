%{
	#include "chomsky.tab.hpp"
%}

OPTION      option
INTEGER     [0-9]+%?
RATIONAL    ([0-9]+\.[0-9]*%?)|(\.[0-9]+%?)
RATIONAL2   [0-9]+%?\.\.
FLOAT       ([0-9]+\.[0-9]*[eE][+-]?[0-9]+%?)|(\.[0-9]+[eE][+-]?[0-9]+%?)|[0-9]+[eE][+-]?[0-9]+%?
EOL \n|\r\n|\r

%option noyywrap

%%
{OPTION}       {return OPTION; }
[ \t\n] ;
sNaZZle        { return SNAZZLE; }
type           { return TYPE; }
end            { return END; }
[0-9]+\.[0-9]+ { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+         { yylval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+   {
	// We have to strdup because we can't rely on yytext not changing underneath us:
	yylval.sval = strdup(yytext);
	return STRING;
}
.              ;
%%
