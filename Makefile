
SHELL=/bin/bash
INSTALL_DIR=~/bin
SCRIPT_TARGET=${INSTALL_DIR}/find-dead-links
PY_TARGET=${INSTAL_DIR}/find-dead-links.py
ENV=${INSTALL_DIR}/find-dead-links-env

install: ${SCRIPT_TARGET} ${PY_TARGET} ${ENV}

${SCRIPT_TARGET}: find-dead-links
	cp find-dead-links ${INSTALL_DIR}
	chmod 700 ${INSTALL_DIR}/find-dead-links

${PY_TARGET}: find-dead-links.py
	cp find-dead-links.py ${INSTALL_DIR}
	chmod 700 ${INSTALL_DIR}/find-dead-links.py

${ENV}:
	cd ${INSTALL_DIR} && virtualenv -p python3 ${ENV}
	source ${ENV}/bin/activate && pip install beautifulsoup4 && pip install requests
