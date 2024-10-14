#!/bin/bash
# SCRIPT: ./UPLOAD
# AUTHOR: Lucas ROUAUD <lucas.rouaud@gmail.com>
# DATE:   09/10/2024
#
# DESCRIPTION
# Fetch JS and CSS of Mol* to use it inside presentation!
#
# USAGE
# ./UPDATE.sh
#
# DEPENDENCIES
# - wget : To fetch JS and CSS of Mol*.

wget --output-document=molstar.js 'https://molstar.org/viewer/molstar.js'
wget --output-document=molstar.css 'https://molstar.org/viewer/molstar.css'
