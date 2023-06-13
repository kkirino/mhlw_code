#!/bin/bash
#
# concatenate.sh
#

set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ROOT_DIR=$(dirname ${SCRIPT_DIR})
DOWNLOADED_DIR=${ROOT_DIR}/downloaded
CMD=${0##*/}
TMP_DIR=/tmp/${CMD}_$$
[ -d ${TMP_DIR} ] || mkdir ${TMP_DIR}

xlsx_files=$(find ${DOWNLOADED_DIR} -type f | grep '\.xlsx$')
for xlsx_file in ${xlsx_files}; do
    xlsx2csv ${xlsx_file} |
    awk -F, -v file_name=${xlsx_file##*/} 'BEGIN {
        OFS=","
    } NR > 1 {
        print $1,$2,$3,$4,file_name
    }' >>${TMP_DIR}/tmp.csv
done

xls_files=$(find ${DOWNLOADED_DIR} -type f | grep '\.xls$')
for xls_file in ${xls_files}; do
    xls2csv ${xls_file} |
        awk -F, -v file_name=${xls_file##*/} 'BEGIN {
            OFS=","
        } NR > 1 {
            print $1,$2,$3,$4,file_name
        }' >>${TMP_DIR}/tmp.csv
done

echo '区分,薬価基準収載医薬品コード,成分名,規格,ファイル名'
cat ${TMP_DIR}/tmp.csv |
    awk -F, '$1=="内用薬" || $1=="注射薬" || $1=="外用薬" || $1=="歯科用薬剤"' |
    sort -u 

rm -rf ${TMP_DIR}
exit 0
