# ===================================================
# Makefile for pretty-printing reports 
# ===================================================

PDFLATEX=pdflatex
DVILATEX=latex
MAKEINDEX=makeindex
BIBTEX=bibtex

default: report

clean:
	(rm -f *HW8.* HOL*.*)

report:
	hol<documentation.sml

# ===================================================
# Change example1Report to the appropriate report name
# ===================================================
	${PDFLATEX} HW8
	${MAKEINDEX} HW8
	${PDFLATEX} HW8

