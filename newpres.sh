#!/bin/bash

# Create and push to a new github repo for a Jekyll presentation 
#    based on Fredrik Eilertsen's neat work.
# You need to first clone https://github.com/fredeil/gh-presentation
#    into a local git repo. This script will clone it locally and
#    create a new repo (private or not) from the command line.
#
# By Geir Isene (https://isene.org/). No rights reserved.
#
# Usage: newpres.sh [-p] REPONAME [DESCRIPTION]

# Parsing the command line
[[ -z $1 ]] && echo "You must supply a repo name" && exit

if [ $1 = "-p" ]
then
	REPO=$2
	DESCR=$3
	PRIV="true"
else
	REPO=$1
	DESCR=$2
	PRIV="false"
fi

[[ -z  $DESCR ]] && DESCR="Presentation"

# Set variables (CHANGE THESE TO FIT YOUR USERNAME AND LOCAL PATH)
USER=       #mygithuUser
REPODIR=    #/home/myuser/$REPO
PRESTEMPL=  #/home/myuser/gh-presentation

# Create the dir, move there, copy presentation 
mkdir $REPODIR
cd $REPODIR
cp -r $PRESTEMPL/* .
git init
cat >> .git/config << EOL
[remote "origin"]
	url = git@github.com:$USER/$REPO.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
EOL

echo "Here we go..."

# Curl some json to the github API oh damn we so fancy
curl -u $USER https://api.github.com/user/repos -d "{\"name\": \"$REPO\", \"description\": \"Presentation\", \"private\": $PRIV, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"

# Push
cd $REPODIR
rm README.md
git add *
git commit -m "Initialized"
git push
