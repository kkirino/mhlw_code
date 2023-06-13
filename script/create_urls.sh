#!/bin/bash
#
# create_file_urls
#

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ROOT_DIR=$(dirname ${SCRIPT_DIR})
DOCUMENT_DIR=${ROOT_DIR}/document

xlsx2csv -n 過去ファイル ${DOCUMENT_DIR}/definition.xlsx |
    awk -F, 'NR>1{print $3}'

xlsx2csv -n 現行ファイル ${DOCUMENT_DIR}/definition.xlsx |
    awk -F, 'NR>1&&$4=="1"{print $3}'
