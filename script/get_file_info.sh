#!/bin/bash
#
# get_file_info.sh
#

set -eu

# パスの設定
SCRIPT_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)
ROOT_DIR=$(dirname "${SCRIPT_DIR}")
DOCUMENT_DIR="${ROOT_DIR}"/document
CMD="${0##*/}"
TMP_DIR=/tmp/"${CMD}"_$$
[ -d "${TMP_DIR}" ] || mkdir "${TMP_DIR}"


# ファイル名と品名の列番号・メーカー名の列番号・年度の対応表を作成
xlsx2csv -n 'ファイル' "${DOCUMENT_DIR}"/archive.xlsx |
    tail -n +2 |
    LANG=C sort |
    join -t, -j 1 - <(awk -F, 'NR>1{print $1","$2}' "${DOCUMENT_DIR}"/page_info | LANG=C sort) |
    awk -F, '{
        file_name=gensub(/.*(tp.+\.xlsx?)$/, "\\1", 1, $2); print $1","$2","$3","$4","$5","file_name
    }' >"${TMP_DIR}"/file_info


# 成果物の作成と一時ファイルの削除
#
# | 列番号 | 変数名  
# |--------|-----------------------------
# | 1      | ページID  
# | 2      | ファイルURL
# | 3      | 品名の列番号
# | 4      | メーカー名の列番号  
# | 5      | 掲載開始年度   
# | 6      | ファイル名  
#
echo 'ページID,ファイルURL,品名の列番号,メーカー名の列番号,掲載開始年度,ファイル名' >"${DOCUMENT_DIR}"/file_info
LANG=C sort -n "${TMP_DIR}"/file_info >>"${DOCUMENT_DIR}"/file_info
rm -rf "${TMP_DIR}"

exit 0

