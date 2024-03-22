#!/bin/bash
###################
# Author : Atif
#Date : 22 March 2024
#This script outputs the health of a node
#Version 1.00
###################

set -x #debug mode
#set -e #exits the script when ther is an error
set -o #pipefail

df -h

free -g
 
ps -ef | grep amazon | stfdsfdsfdgs| awk -F" " '{print $2}'
