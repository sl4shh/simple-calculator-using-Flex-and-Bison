all:
	flex *.l
	bison -dy *.y
	gcc lex.yy.c y.tab.c -o test
	./test

flex:
	flex *.l
	gcc lex.yy.c -o file_name