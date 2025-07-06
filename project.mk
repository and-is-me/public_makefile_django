
ifneq (,$(wildcard ./.project))
    include .project
    export
endif

PROJECT_NAME_=${PROJECT_NAME}
ENV_PATH_=/opt/${ENV_PATH}
ACTIVATE=$(ENV_PATH_)/venv/bin/activate

help:		## - display all commands
	@echo "PROJECT_NAME is = ${PROJECT_NAME_}"
	@echo "ENV_PATH = ${ENV_PATH}"
	@echo "full ENV_PATH = ${ENV_PATH_}"
	@echo "source $(ACTIVATE)"
	@echo ""
	@echo "Commands:"
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
prepare: 	## - prepare env and install requirements
	mkdir -p ${ENV_PATH_}
	python3 -m venv ${ENV_PATH_}/venv
	make install
install: 	## - install requirements
	. $(ACTIVATE); pip install -r src/requirements.txt
i: install
uninstall: 	## - uninstall requirements
	 pip freeze | xargs pip uninstall --yes
ui: uninstall
style_check:	## - check style
	echo "run style ruff  check"
	. $(ACTIVATE); ruff check
style:		## - format style
	@echo "run style ruff format"
	. $(ACTIVATE); ruff format
migrations:	## - create migrations
	. $(ACTIVATE); src/manage.py makemigrations;
mig: migrations
migrate: 	## - run migrations
	. $(ACTIVATE); @src/manage.py migrate
m: migrate
collect: 	## - collect static
	. $(ACTIVATE); src/manage.py collectstatic --no-input
c: collect
json_dumb: 	## - make dump
	. $(ACTIVATE); src/manage.py dumpdata > db.json --exclude admin.logentry --exclude auth.permission --exclude contenttypes

run:		## - run server
	. $(ACTIVATE); src/manage.py runserver 18040



copy_gitignore:	## - copy .gitignore file from public_gitignore repo
	git fetch git@github.com:and-is-me/public_gitignore.git main:public_gitignore
	git checkout public_gitignore -- .gitignore
	git commit -m "Grabbed .gitignore from public_gitignore.git"
	git push
