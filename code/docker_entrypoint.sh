#!/bin/bash

########################################
# Nativation to verify the nginx folders
########################################
echo ""
echo ""
echo "*********************"
echo "    Navigation"
echo "*********************"
whoami
nginx stop
pwd
ls
cd /src
ls
cat ./generate_index_html.sh
echo ""
echo "*********************"
echo "Get ip address"
echo "*********************"
ip addr show
echo ""
ls
echo "*******Delete********"
rm index.html
echo "*******Deleted?********"
ls
"/bin/sh" ./generate_index_html.sh > ./index.html
echo "*******Generated?******"
ls
cat ./index.html

########################################
# Start ngnix server
# The configuration for the server contains also 
# 'daemon off;'')
# to replace the start command for the
# container image.
# CMD ["nginx", "-g", "daemon off;"]
########################################
echo ""
echo ""
echo "*********************"
echo "Start server"
echo "*********************"
nginx