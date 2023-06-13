#!/bin/bash
#
# download.sh
# 
# file_list に記載された URL よりダウンロードするスクリプト
# 3 秒ごとにダウンロードを実行、既にダウンロード済みのファイルは重複してダウンロードしない

set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ROOT_DIR=$(dirname ${SCRIPT_DIR})
DOCUMENT_DIR=${ROOT_DIR}/document
DOWNLOADED_DIR=${ROOT_DIR}/downloaded
[ -d ${DOWNLOADED_DIR} ] || mkdir -p ${DOWNLOADED_DIR}

wget -w 1 -nc -P ${DOWNLOADED_DIR} -i ${DOCUMENT_DIR}/urls
