#!/bin/bash

OUTPUT="./output"
GH_REPO="../aleozlx.github.io"

rebuild (){
    pelican content -s publishconf.py
    rsync LICENSE $OUTPUT/
}

publish (){
    rsync -avrc --delete --exclude=".git" $OUTPUT/ $GH_REPO/
    cd $GH_REPO
    git add --all
    git commit -m "update"
    git remote get-url origin
    git push -u origin master
}

rebuild && publish
