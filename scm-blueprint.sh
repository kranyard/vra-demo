#!/bin/bash

BLUEPRINT=CentOSTest

./do_export.py $BLUEPRINT

unzip -o $BLUEPRINT.zip -d $BLUEPRINT

git add $BLUEPRINT

git commit -m "Comment"

git push

rm $BLUEPRINT.zip
