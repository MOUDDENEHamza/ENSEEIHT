#!/bin/sh

# Add the new files
git add .

# Make a commit
read -p "The message to commit : " message
git commit -m "#$message"

# Push to remote repository
git push
