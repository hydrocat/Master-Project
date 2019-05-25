RM_EXTENSIONS=*~ *.log *.aux *.toc *.dvi *.bbl *.blg *.*~* *.lof *.lot *.cb *.backup *.out *.glo *.idx *.fls *.lol *.ilg *.gls *.bcf *.xml *.ist *.glg

PDF_FLAGS=--shell-escape -file-line-error -interaction nonstopmode -recorder --src-specials
YABISRC=/home/hydrocat/git/yabi-backend/src/main/java/ipb/yabi

relatorio.pdf: clean-relatorio listings
	rm -f $(RM_EXTENSIONS)
	pdflatex $(PDF_FLAGS) relatorio
	biber relatorio
	makeglossaries relatorio
	pdflatex $(PDF_FLAGS) relatorio
	pdflatex $(PDF_FLAGS) relatorio
	rm -f $(RM_EXTENSIONS)

listings:
	ln -s $(YABISRC) listings

clean-relatorio:
	rm -f relatorio.pdf

clean-listings:
	rm -f listings

clean: clean-listings clean-relatorio
