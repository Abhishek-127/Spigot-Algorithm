c:
	gcc -Wall -std=c11 pre_spigot.c
	gcc -Wall -std=c11 spigot.c
	./a.out

quick:
	git add *
	git commit -m "This is a quick commit"
	git push

python:
	python spigot.py

fortran:
	gfortran -Wall spigot.f95
	./a.out
	rm a.out

ada:
	gnatmake spigot.adb
	./spigot
	rm spigot
	rm spigot.ali
	rm spigot.o
