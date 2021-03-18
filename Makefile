
INSTALL_DIR = ${HOME}/bin

find-dead-links: find-dead-links.py find-dead-links-env
	cp find-dead-links ${INSTALL_DIR}
