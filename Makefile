include include.mk

${PROJECT_NAME}:
	@echo ${PROJECT_NAME} is a static file.
	@echo You could probably build a file in here if you were using a compiled language though.

${PROJECT_NAME}.1.gz: README.md
	rvm install 2.2.2
	rvm 2.2.2 do gem install ronn
	grep -vE '^\[!\[Build Status\]' README.md | rvm 2.2.2 do ronn |gzip -9> ${PROJECT_NAME}.1.gz
	grep -vE '^\[!\[Build Status\]' README.md | rvm 2.2.2 do ronn -m | cat
