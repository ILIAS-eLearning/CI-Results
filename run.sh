#!/bin/bash
DICTO_PATH="/tmp/dicto_latest.csv"
PHPUNIT_PATH="/tmp/phpunit_latest.csv"
PHPFIX_RESULTS_PATH="/tmp/phpfix_results"

DATE=`date '+%Y-%m-%d-%H:%M:%S'`
FOLDER_DATE=`date '+%Y-%m'`

if [ ! -d "results/$FOLDER_DATE" ]
then
	mkdir "results/$FOLDER_DATE"
fi

if [ -e "$PHPUNIT_PATH" ]
then
	cp "$PHPUNIT_PATH" "results/$FOLDER_DATE/phpunit_$TRAVIS_BUILD_NUMBER_$DATE.txt"
fi

if [ -e "$DICTO_PATH" ]
then
	cp "$DICTO_PATH" "results/$FOLDER_DATE/dicto_$TRAVIS_BUILD_NUMBER_$DATE.txt"
fi

if [ -e "$PHPFIX_RESULTS_PATH" ]
then
	cp "$PHPFIX_RESULTS_PATH" "data/phpfix_results.json"
	cp "$PHPFIX_RESULTS_PATH" "results/$FOLDER_DATE/phpfix_$TRAVIS_BUILD_NUMBER_$DATE.json"
fi

git remote add results https://${ILIAS_VAR}@github.com/ILIAS-eLearning/CI-Results > /dev/null 2>&1
git fetch
git add . && git commit -m "$TRAVIS_BUILD_NUMBER - $DATE - $TRAVIS_EVENT_TYPE"
git push --quiet --set-upstream results master
if [ "$?" -ne 0 ]
then
	git pull --no-edit && git push --quiet --set-upstream results master
fi