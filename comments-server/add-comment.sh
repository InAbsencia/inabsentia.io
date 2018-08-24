#!/bin/bash

# Check usage
if [ "$#" -lt 4 ]
then
    echo "Usage: ./add-comment.sh <reply_to> <author> <email> <text>"
    exit 1
fi

# Make sure our reference repo is up to date
if [ ! -d "repo" ]
then
    echo "Please clone into a local repo:"
    echo "git clone --bare <REPO_URL.git> repo"
    exit
fi
pushd repo
git fetch --all --prune
popd

# Generate a comment id
CID="$(date +%s)-$(pwgen)"

# Create a working copy
git clone -b master repo "$CID"
pushd "$CID"

# Read input
reply_to="$1"
author="$2"
email="$3"
text="$4"

# Create new branch
BRANCH="comment/$CID"
git checkout -b "$BRANCH"

# Create comment file
FILE="src/_data/comments/$CID.yaml"
mkdir -p $(dirname "$FILE")
for field in reply_to author email text
do
    yq n "$field" "${!field}" >> "$FILE"
done

# Commit comment and push to local repo
git add "$FILE"
git commit -m "Added comment $CID."
git push origin "$BRANCH"
popd

# Clean up temporary clone
rm -rf "$CID"

# Push local repo to original remote
pushd repo
git push --all
popd

# Send notification email
cp -r ~/.scripts/mail_template.txt ./email.tmp
echo "Reply to: $1" >> email.tmp
echo "Author: $2" >> email.tmp
echo "Email: $3" >> email.tmp
echo "Text: $4" >> email.tmp

sh ~/.scripts/send_email.sh

rm -rf email.tmp
