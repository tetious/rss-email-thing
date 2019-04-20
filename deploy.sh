#! /bin/bash

zip function.zip *.rb
aws lambda update-function-code --function-name rss-email-thing --zip-file fileb://function.zip
rm -f function.zip