#!/bin/bash

curl https://github.com/lechimp-p/dicto.php/releases/download/0.6.1/dicto.phar -L -o dicto.phar
php -d memory_limit=-1 dicto.phar analyze CI-Results/dicto/config.yaml
php -d memory_limit=-1 dicto.phar report diff CI-Results/dicto/config.yaml | head -n -2 > "CI-Results/dicto/reports/$(date).html"
cd CI-Results
git add dicto/reports/*
git add dicto/results/*
git commit -a -m "new dicto-results"
git push origin master
cd ..
