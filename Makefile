# This Makefile is just for building the release distribution.
# It's not needed for just building MProjectNavigator; that's
# done with Matlab and IntelliJ.

.PHONY: dist

PROGRAM=MProjectNavigator
VERSION=$(shell cat VERSION)
DIST=dist/${PROGRAM}-${VERSION}
FILES=README.md LICENSE lib Mcode bootstrap doc 

dist:
	rm -rf dist/*
	mkdir -p ${DIST}
	cp -R $(FILES) $(DIST)
	cd dist; tar czf ${PROGRAM}-${VERSION}.tgz --exclude='*.DS_Store' ${PROGRAM}-${VERSION}
	cd dist; zip -rq ${PROGRAM}-${VERSION}.zip ${PROGRAM}-${VERSION} -x '*.DS_Store'
