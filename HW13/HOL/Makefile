# ===================================================
# Makefile for HOL 
# ===================================================

default: theory

clean:
	Holmake cleanAll; 
	cd Exercises/SM0;Holmake cleanAll;cd HOLReports; make clean;
	cd HOLReports;make clean;Holmake cleanAll;

theory:
	Holmake cleanAll;Holmake;
	cd HOLReports;make clean;make;
	cd Exercises/SM0;Holmake cleanAll;Holmake;cd HOLReports;make clean;make;

update:
	make;
