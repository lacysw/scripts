#/opt/homebrew/bin/bash
 
read -p "Message: " msg

if [ -z $msg ]
    then msg="Generic update(s); no commit message provided"
fi

git add .
git commit -m "$msg"
git push
