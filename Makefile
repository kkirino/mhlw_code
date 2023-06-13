.PHONY: archive \
	setup \
	update \
	clean


setup: document/definition.xlsx \
       document/urls \
       document/downloaded_files

document/definition.xlsx: 
	[ -d document ] || mkdir document
	[ -e document/definition.xlsx ] || ln -s '/mnt/c/Users/kkirino/OneDrive - 国立成育医療研究センター/archive_mhlw_files/definition.xlsx' document/

document/urls: document/definition.xlsx script/create_urls.sh
	script/create_urls.sh >document/urls

# ダウンロード後に存在するべきファイルパスをファイルに記載し、変数 $(DOWNLOADED_FILES) に格納する
document/downloaded_files: document/urls script/create_downloaded_files.sh 
	script/create_downloaded_files.sh >document/downloaded_files


include document/downloaded_files

archive: setup \
         $(DOWNLOADED_FILES) \
         concatenated/tmp.csv \
	 README.md
         # concatenated/master.csv


$(DOWNLOADED_FILES):
	script/download.sh

concatenated/tmp.csv: $(DOWNLOADED_FILES)
	[ -d concatenated ] || mkdir concatenated
	script/concatenate.sh >concatenated/tmp.csv

# concatenated/master.csv: concatenated/tmp.csv
# 	script/create_master.r

README.md: README.rmd
	Rscript -e 'rmarkdown::render("README.rmd")'


update: \
	README.md

clean:
	rm -rf downloaded/ document/ concatenated/

