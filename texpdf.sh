#/opt/homebrew/bin/bash

# Description: Sends .tex file specified by arg[1] to $rhost for compilation;
# requests .tex -> .pdf conversion via pdflatex and returns the built PDF.
# Then, cleans the build directory on the remote machine. Logs conversion
# process.

# DEFINE REMOTE HOST AND REMOTE PATH HERE
rhost=sid@192.168.2.3
rpath=/home/sid/tex

if [ -z $1 ]; then
    echo Must provide a file.
    exit
fi

filename=$(echo $1 | cut -d. -f1)

scp $1 $rhost:$rpath/$1 > /dev/null 2>&1
ssh $rhost "cd $rpath; pdflatex $1" > $filename.$(date date "+%F-%T").log
scp $rhost:$rpath/$filename.pdf .
ssh $rhost "cd $rpath; rm $filename.tex; rm $filename.log; rm $filename.aux; rm $filename.pdf"
