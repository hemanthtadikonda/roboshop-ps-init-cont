#!/bin/bash

for parameter in $PARAMETERS; do
  ssm_parameter=$(echo $parameter | awk -F , '{print $1}')
  app_parameter=$(echo $parameter | awk -F , '{print $2}')
  echo ${app_parameter}=\"$(aws ssm get-parameter  --name $ssm_parameter --with-decryption | jq .Parameter.Value | sed -e 's/"//g')\" >>/common/parameters
done







##!/bin/bash
#
#for parameter in catalogue.dev.MONGO_URL,MONGO_URL catalogue.dev.DOCUMENTDB,DOCUMENTDB; do
#  ssm_parameter=$(echo $parameter | awk -F , '{print $1}')
#  app_parameter=$(echo $parameter | awk -F , '{print $2}')
#
#  echo $app_parameter=\"$(aws ssm get-parameter --name $ssm_parameter --with-decryption | jq .Parameter.value | sed -e 's/"//g')\" >>/root/parameter
#done
#
#echo $ssm_parameter
#echo $app_parameter
