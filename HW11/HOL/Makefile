# ===================================================
# Makefile for HOL 
# ===================================================

default: theory

clean:
	Holmake cleanAll; 
	cd Exercises;make clean;Holmake cleanAll;
	cd HOLReports;make clean;Holmake cleanAll;

theory:
	Holmake cleanAll;Holmake;
	cd HOLReports;make clean;make;
	cd Exercises;make clean;make;

update:
	make;
