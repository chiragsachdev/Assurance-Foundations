# ===================================================
# Makefile for Latex 
# ===================================================

default: theory

clean:
	mv Report.tex ../;rm -rf Report.*;cd ../;mv Report.tex Latex/

theory:
	latex Report.tex;pdflatex Report.tex

update:
	make clean;make theory
