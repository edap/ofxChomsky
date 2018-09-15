%{
	#include "chomsky.tab.hpp"
%}

INTEGER_REG     [0-9]+%?
RATIONAL_REG    ([0-9]+\.[0-9]*%?)|(\.[0-9]+%?)
RATIONAL2_REG   [0-9]+%?\.\.
FLOAT_REG       ([0-9]+\.[0-9]*[eE][+-]?[0-9]+%?)|(\.[0-9]+[eE][+-]?[0-9]+%?)|[0-9]+[eE][+-]?[0-9]+%?
EOL \n|\r\n|\r


%option noyywrap
%option prefix="Chomsky"


%%
option       {return OPTION; }
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
