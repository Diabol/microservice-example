#!/bin/bash
set -e
set -x
echo "Running release script..."
echo "another line..." >> dummy.txt
git config user.name "travis"
git config user.email "travis@diabol.se"
remote=`git config remote.origin.url | sed -n 's/https:\/\/\(.*\)/git@\1/p'`
git remote set-url origin $remote
ENCRYPTED_KEY="\$encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV="\$encrypted_${ENCRYPTION_LABEL}_iv"
openssl aes-256-cbc -K $encrypted_8ded143b9563_key -iv $encrypted_8ded143b9563_iv -in travis_deploy_key.enc -out travis_deploy_key -d
chmod 600 travis_deploy_key
eval `ssh-agent -s`
ssh-add travis_deploy_key
git add dummy.txt
git commit -m "added line to dummy.txt"
git push
