#!/bin/bash

for parameter in "catalogue.dev.MONGO_URL,MONGO_URL catalogue.dev.DOCUMENTDB,DOCUMENTDB";do
  ssm_parameter =  $(echo parameter | awk -F , '{ print $1 }'
  app_parameter =  $(echo parameter | awk -F , '{ print $1 }'

  echo $app_parameter=aws ssm get-parameter --name $ssm_parameter --with-decryption | jq .Parameter.value | sed -e 's/"//g'
done



