
ifneq (,$(wildcard ./.project))
    include .project
    export
endif

PROJECT_NAME_=${PROJECT_NAME}
ENV_PATH_=/opt/${ENV_PATH}
ACTIVATE=$(ENV_PATH_)/venv/bin/activate

help:	# показать все комманды
	echo PROJECT_NAME=${PROJECT_NAME_}
	echo ENV_PATH=${ENV_PATH}
	@grep '^[^#[:space:]].*:' Makefile
	echo "source $(ACTIVATE)"
prepare: # подготовить окружение, установить данные
	mkdir -p ${ENV_PATH_}
	python3 -m venv ${ENV_PATH_}/venv
	make install
install:
	#$(BIN)pip install --upgrade pip;
	#$(BIN)pip install -r requirements.txt
	. $(ACTIVATE); pip install -r src/requirements.txt
i: install
style_check:
	echo "run style ruff  check"
	. $(ACTIVATE); ruff check
style:
	echo "run style ruff format"
	. $(ACTIVATE); ruff format
migrations:
	. $(ACTIVATE); src/manage.py makemigrations;
mig: migrations
migrate:
	. $(ACTIVATE); src/manage.py migrate
m: migrate
collect:
	. $(ACTIVATE); src/manage.py collectstatic --no-input
c: collect
json_dumb:
	. $(ACTIVATE); src/manage.py dumpdata > db.json --exclude admin.logentry --exclude auth.permission --exclude contenttypes
