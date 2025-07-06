
# this is

help:	## - show this help
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
	@echo "* * *"
	@sed -ne '/@sed/!s/## //p' project.mk

push:	## - push
	git add .
	git commit -m "💾"
	git push gitlab
	git push github

