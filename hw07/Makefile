all: hw07_make.md length_distribution.png

clean:
	rm -f words.en.txt words.en.length words.en.html

words.en.crlf.txt: step1_download_data.R
	Rscript step1_download_data.R
	
words_length.txt: words.en.crlf.txt step2_read_data_analysis.R
	Rscript step2_read_data_analysis.R words.en.crlf.txt

words_starts.txt: words.en.crlf.txt step2_read_data_analysis.R
	Rscript step2_read_data_analysis.R words.en.crlf.txt

length_distribution.png: words_length.txt words_starts.txt step3_draw_fig.R
	Rscript step3_draw_fig.R words_length.txt words_starts.txt

n_starts.png: words_starts.txt step3_draw_fig.R
	Rscript step3_draw_fig.R words_length.txt words_starts.txt
	
hw07_make.md: words.en.crlf.txt hw07_make.Rmd length_distribution.png
	Rscript -e 'rmarkdown::render("hw07_make.Rmd")' words.en.crlf.txt length_distribution.png