#!/bin/bash
url=$(git config --get remote.origin.url) || { echo "No git repository found in current folder"; exit 1;}
repository=$(basename "$url" ".${url##*.}")
branch=$(git rev-parse --abbrev-ref HEAD)

echo -e "You are comitting to \e[92m${repository}\e[39m on branch \e[92m${branch}\e[39m"

echo "Please enter the Jira ticket name"
read issueName

echo "Please enter your commit message"
read commitMessage

fullMessage="${issueName} ${commitMessage}"

echo "Committing and pushing all changes to git with message: ${fullMessage}"

git add -A || exit 1

git commit -m "${fullMessage}" || exit 1

git push || exit 1

echo "Successfully pushed to server"

exit 0