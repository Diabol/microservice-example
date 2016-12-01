#!/bin/bash
set -e
set -x
echo "Running release script..."

# prepare the ssh key
openssl aes-256-cbc -K $encrypted_8ded143b9563_key -iv $encrypted_8ded143b9563_iv -in travis_deploy_key.enc -out travis_deploy_key -d
chmod 600 travis_deploy_key
eval `ssh-agent -s`
ssh-add travis_deploy_key

# prepare the repo
git config user.name "travis"
git config user.email "travis@diabol.se"
git config --global push.default simple
remote=`git config remote.origin.url | sed -n 's/https:\/\/github.com\/\(.*\)/git@github.com:\1/p'`
git remote remove origin
git remote add origin $remote
git fetch

# do a change
git checkout origin/master
echo "another line..." >> dummy.txt
git add dummy.txt
git commit -m "added line to dummy.txt"
git push
