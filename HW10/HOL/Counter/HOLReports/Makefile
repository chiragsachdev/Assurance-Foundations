# ===================================================
# Makefile for pretty-printing reports 
# ===================================================

PDFLATEX=pdflatex
DVILATEX=latex
MAKEINDEX=makeindex
BIBTEX=bibtex

default: report

clean:
	(rm -f *ReportCounter.* HOL*.*)

report:
	hol<documentation.sml

# ===================================================
# Change example1Report to the appropriate report name
# ===================================================
	${PDFLATEX} ReportCounter
	${MAKEINDEX} ReportCounter
	${PDFLATEX} ReportCounter

