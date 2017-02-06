#!/bin/bash

cd /root/vra-demo

while [[ $# > 1 ]]
do
key="$1"

case $key in
    -h|--host)
    VRA_HOST="$2"
    shift # past argument
    ;;
    -t|--tenant)
    TENANT="$2"
    shift # past argument
    ;;
    -u|--username)
    USERNAME="$2"
    shift # past argument
    ;;-p|--password)
    PASSWORD="$2"
    shift # past argument
    ;;
    -bp|--blueprint)
    BLUEPRINT="$2"
    shift # past argument
    ;;
    -a|--author)
    AUTHOR="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

./do_export.py $BLUEPRINT

unzip -o $BLUEPRINT.zip -d $BLUEPRINT

git add $BLUEPRINT

git commit -m "Comment"

git push

rm $BLUEPRINT.zip
