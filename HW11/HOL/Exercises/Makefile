# ===================================================
# Makefile for HOL 
# ===================================================

default: theory

clean:
	Holmake cleanAll; 
	cd HOLReports;make clean;Holmake cleanAll;

theory:
	Holmake cleanAll;Holmake;
	cd HOLReports;make clean;make;

update:
	make;
