#------------------------------------------------------------
# [[APP_NAME]] ([[APP_URL]])
#
# @link      [[APP_REPOSITORY_URL]]
# @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
# @license   [[LICENSE_URL]] ([[LICENSE]])
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to simulate upload to CGI app in shell for Linux
#------------------------------------------------------

CURRDIR=$PWD

# change current working dir, to simulate how cgi
# app executed by web server
cd public

export REQUEST_METHOD="POST"

if [ -z "$REQUEST_URI" ]; then
    export REQUEST_URI="/submit"
fi

export CONTENT_TYPE="multipart/form-data; boundary=---------------------------180827127318073990461644340351"
export CONTENT_LENGTH="20051876"

cat "$CURRDIR/tools/outputnc.txt" | ./app.cgi

cd $CURRDIR
