DERIVED = lex.yy.cpp snazzle.tab.hpp snazzle

all: $(DERIVED)

lex.yy.cpp: ../snazzle.l snazzle.tab.hpp
	flex -o lex.yy.cpp ../snazzle.l

snazzle.tab.hpp: ../snazzle.ypp
	bison -o snazzle.tab.hpp ../snazzle.ypp

snazzle: lex.yy.cpp snazzle.tab.hpp
	g++ snazzle.tab.hpp lex.yy.cpp -o snazzle

clean:
	rm $(DERIVED)
