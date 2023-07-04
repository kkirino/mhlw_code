all: document/archive.xlsx \
     document/page_info \
     document/file_info \
     document/downloaded_files \
     data/created/concatenated \
     README.md
     # created/master \

document/archive.xlsx: 
	[ -d document ] || mkdir document
	[ -e document/archive.xlsx ] || ln -s '/mnt/c/Users/kkirino/OneDrive - 国立成育医療研究センター/mhlw_code/archive.xlsx' document/

document/page_info: document/archive.xlsx script/get_page_info.py
	python3 script/get_page_info.py

document/file_info: document/archive.xlsx document/page_info script/get_file_info.sh
	script/get_file_info.sh

document/downloaded_files: document/file_info script/download.sh
	script/download.sh

data/created/concatenated: document/downloaded_files document/file_info script/concatenate.sh
	script/concatenate.sh

# data/created/master: data/created/concatenated script/create_master.r
# 	Rscript script/create_master.r

README.md: README.rmd document/page_info document/file_info # data/created/concatenated
	Rscript -e 'rmarkdown::render("README.rmd")'

clean:
	rm -rf document/ data/created/ && rm -f README.html README.md

clean_all:
	rm -rf data/downloaded/ document/ data/created/ && rm -f README.html README.md

.PHONY: all clean clean_all


