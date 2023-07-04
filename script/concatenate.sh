#!/bin/bash
#
# get_concatenated.sh
#

set -eu

# パスの設定
SCRIPT_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)
ROOT_DIR=$(dirname "${SCRIPT_DIR}")
DOWNLOADED_DIR="${ROOT_DIR}"/data/downloaded
DOCUMENT_DIR="${ROOT_DIR}"/document
CMD="${0##*/}"
TMP_DIR=/tmp/"${CMD}"_$$
[ -d "${TMP_DIR}" ] || mkdir "${TMP_DIR}"

# downloaded_files と files の整合性確認
awk -F, 'NR>1{print $6}' "${DOCUMENT_DIR}"/file_info | 
    LANG=C sort >"${TMP_DIR}"/defined_files

if ! diff <(tail -n +2 "${DOCUMENT_DIR}"/downloaded_files | LANG=C sort) "${TMP_DIR}"/defined_files >/dev/null 2>&1; then
    echo 'ダウンロード済みファイル名が定義と異なります'
    exit 1
fi

# XLSX ファイルの連結
xlsx_files=$(find "${DOWNLOADED_DIR}" -type f | grep 'xlsx$')
for xlsx_file in $xlsx_files; do
    num_drug_name=$(awk -F, -v file_name="${xlsx_file##*/}" '$6==file_name{print $3}' "${DOCUMENT_DIR}"/file_info)
    num_manufacturer=$(awk -F, -v file_name="${xlsx_file##*/}" '$6==file_name{print $4}' "${DOCUMENT_DIR}"/file_info)
    year=$(awk -F, -v file_name="${xlsx_file##*/}" '$6==file_name{print $5}' "${DOCUMENT_DIR}"/file_info)
    xlsx2csv "$xlsx_file" |
        awk -F, -v num_drug_name="$num_drug_name" -v num_manufacturer="$num_manufacturer" -v year="$year" 'BEGIN {
            OFS=","
        } NR > 1 {
            print $2,$3,$1,$4,$num_drug_name,$num_manufacturer,year
        }' >>"${TMP_DIR}"/concatenated
done

# XLS ファイルの連結
xls_files=$(find "${DOWNLOADED_DIR}" -type f | grep 'xls$')
for xls_file in $xls_files; do
    num_drug_name=$(awk -F, -v file_name="${xls_file##*/}" '$6==file_name{print $3}' "${DOCUMENT_DIR}"/file_info)
    num_manufacturer=$(awk -F, -v file_name="${xls_file##*/}" '$6==file_name{print $4}' "${DOCUMENT_DIR}"/file_info)
    year=$(awk -F, -v file_name="${xls_file##*/}" '$6==file_name{print $5}' "${DOCUMENT_DIR}"/file_info)
    xls2csv "$xls_file" |
        awk -F, -v num_drug_name="$num_drug_name" -v num_manufacturer="$num_manufacturer" -v year="$year" 'BEGIN {
            OFS=","
        } NR > 1 {
            print $2,$3,$1,$4,$num_drug_name,$num_manufacturer,year
        }' >>"${TMP_DIR}"/concatenated
done
 

# 出力先の設定
CREATED_DIR="${ROOT_DIR}"/data/created
[ -d "${CREATED_DIR}" ] || mkdir -p "${CREATED_DIR}"


# 生成物作成
#
# | 列番号 | 変数名  
# |--------|-----------------------------
# | 1      | 薬価基準収載医薬品コード
# | 2      | 成分名
# | 3      | 区分 
# | 4      | 規格
# | 5      | 品名
# | 6      | メーカー名
# | 7      | 年度   
#
echo '薬価基準収載医薬品コード,成分名,区分,規格,品名,メーカー名,年度' >"${CREATED_DIR}"/concatenated
awk -F, '$3=="内用薬" || $3=="注射薬" || $3=="外用薬" || $3=="歯科用薬剤"' "${TMP_DIR}"/concatenated |
    LANG=C sort -u >>"${CREATED_DIR}"/concatenated
 
 
 # 一次ディレクトリを削除
 rm -rf "${TMP_DIR}"

 exit 0
