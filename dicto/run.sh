#!/bin/bash

cd ../..
curl https://github.com/lechimp-p/dicto.php/releases/download/0.6.1/dicto.phar -o dicto.phar
dicto.phar analyze CI-Results/dicto/config.yaml
