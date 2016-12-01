#!/bin/sh
echo "Running release script..."
echo "another line..." >> dummy.txt
git config user.name "travis"
git config user.email "travis@diabol.se"
ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in travis_deploy_key.enc -out travis_deploy_key -d
chmod 600 deploy_key
eval `ssh-agent -s`
ssh-add deploy_key
git add dummy.txt
git commit -m "added line to dummy.txt"
git push
