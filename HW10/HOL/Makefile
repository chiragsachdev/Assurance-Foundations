# ===================================================
# Makefile for HOL 
# ===================================================

default: theory

clean:
	Holmake cleanAll; 
	cd M1;Holmake cleanAll;cd HOLReports;make clean;Holmake cleanAll;
	cd Counter;Holmake cleanAll;cd HOLReports;make clean;Holmake cleanAll;

theory:
	Holmake cleanAll;Holmake;
	cd M1;Holmake cleanAll;Holmake;cd HOLReports;make clean;make;
	cd Counter;Holmake cleanAll;Holmake;cd HOLReports;make clean;make;

update:
	make;
