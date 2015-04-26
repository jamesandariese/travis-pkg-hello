# default some travis stuff

openparen=(

PROJECT_NAME=$(shell head -1 README.md | grep -o "^[^$(openparen)]*" )

FPM_URL=$(shell git remote -v show origin | grep Fetch\ URL |cut -d: -f 2-|grep -o '[^ ].*'|sed -e 's/\.git$$//')
ifeq (${FPM_URL},)
FPM_URL=http://nourl
endif

ifeq (${TRAVIS_REPO_SLUG},)
FPM_DEFAULT_DESCRIPTION=$(basename ${PWD})
else
FPM_DEFAULT_DESCRIPTION=${TRAVIS_REPO_SLUG}
endif

FPM_DESCRIPTION=$(shell head -1 README.md | grep -oE ' -- .*' | cut -c 5- | awk '/[^ \t]/{print;x=1} END {if (!x) print "${FPM_DEFAULT_DESCRIPTION}"}')





ifeq (${TRAVIS_BUILD_NUMBER},)
TRAVIS_BUILD_NUMBER=0
endif

PACKAGE_VERSION=$(shell echo "${TRAVIS_TAG}" | grep -oE '^v[0-9.]+$$' | cut -c 2-)
ifeq (${PACKAGE_VERSION},)
PACKAGE_TYPE=-dev
PACKAGE_VERSION=${TRAVIS_BUILD_NUMBER}
FPM_CONFLICTS=--conflicts ${PROJECT_NAME} --provides ${PROJECT_NAME}
else
PACKAGE_TYPE=
endif


ALL: 	${PROJECT_NAME}${PACKAGE_TYPE}_${PACKAGE_VERSION}_amd64.deb \
	${PROJECT_NAME}${PACKAGE_TYPE}-${PACKAGE_VERSION}-1.x86_64.rpm

${PROJECT_NAME}${PACKAGE_TYPE}_${PACKAGE_VERSION}_amd64.deb: ${PROJECT_NAME} ${PROJECT_NAME}.1.gz
	gem install fpm
	mkdir -p build-deb/usr/bin build-deb/usr/share/man/man1
	cp ${PROJECT_NAME} build-deb/usr/bin
	cp ${PROJECT_NAME}.1.gz build-deb/usr/share/man/man1
	fpm ${FPM_CONFLICTS} --description "${FPM_DESCRIPTION}" --url "${FPM_URL}" -s dir -t deb -n ${PROJECT_NAME}${PACKAGE_TYPE} -v ${PACKAGE_VERSION} -C build-deb .

${PROJECT_NAME}${PACKAGE_TYPE}-${PACKAGE_VERSION}-1.x86_64.rpm: ${PROJECT_NAME} ${PROJECT_NAME}.1.gz
	gem install fpm
	mkdir -p build-rpm/usr/bin build-rpm/usr/share/man/man1
	cp ${PROJECT_NAME} build-rpm/usr/bin
	cp ${PROJECT_NAME}.1.gz build-rpm/usr/share/man/man1
	fpm ${FPM_CONFLICTS} --description "${FPM_DESCRIPTION}" --epoch 0 --url "${FPM_URL}" -s dir -t rpm -n ${PROJECT_NAME}${PACKAGE_TYPE} -v ${PACKAGE_VERSION} -C build-rpm .

clean:
	rm -rf ${PROJECT_NAME} ${PROJECT_NAME}.1.gz ${PROJECT_NAME}*.deb ${PROJECT_NAME}*.rpm build-deb build-rpm
