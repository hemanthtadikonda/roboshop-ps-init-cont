#!/bin/bash

for parameter in "catalogue.dev.MONGO_URL,MONGO_URL catalogue.dev.DOCUMENTDB,DOCUMENTDB"; do
  ssm_parameter =  $(echo $parameter | awk -F , '{ print $1 }' )
  app_parameter =  $(echo $parameter | awk -F , '{ print $2 }' )

  echo $app_parameter=\"$(aws ssm get-parameter --name $ssm_parameter --with-decryption | jq .Parameter.value | sed -e 's/"//g')\" >>/root/parameter
done

##!/bin/bash
#
#for parameter in docdb.dev.master_username,MONGO_URL docdb.dev.master_username,DOCUMENTDB; do
#  ssm_parameter=$(echo $parameter | awk -F , '{print $1}')
#  app_parameter=$(echo $parameter | awk -F , '{print $2}')
#  echo ${app_parameter}=\"$(aws ssm get-parameter  --name $ssm_parameter --with-decryption | jq .Parameter.Value | sed -e 's/"//g')\" >>/root/parameters
#done



