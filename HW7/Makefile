# ===================================================
# Makefile for HW 
# ===================================================

default: theory

clean:
	cd HOL;make clean;cd ../;cd Latex;make clean

theory:
	cd HOL;make;cd ../;cd Latex;make

update:
	cd HOL;make clean;make;cd ../;cd Latex;make clean;make
