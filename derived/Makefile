DERIVED = lex.yy.cpp chomsky.tab.hpp chomsky

all: $(DERIVED)

lex.yy.cpp: ../chomsky.l chomsky.tab.hpp
	flex -o lex.yy.cpp ../chomsky.l

chomsky.tab.hpp: ../chomsky.ypp
	bison -o chomsky.tab.hpp ../chomsky.ypp

chomsky: lex.yy.cpp chomsky.tab.hpp
	g++ chomsky.tab.hpp lex.yy.cpp -o chomsky

clean:
	rm $(DERIVED)
