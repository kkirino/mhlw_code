#!/bin/bash
#
# download.sh
# 

set -eu

# パスの設定
SCRIPT_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)
ROOT_DIR=$(dirname "${SCRIPT_DIR}")
DOCUMENT_DIR="${ROOT_DIR}"/document

DOWNLOADED_DIR="${ROOT_DIR}"/data/downloaded
[ -d "${DOWNLOADED_DIR}" ] || mkdir -p "${DOWNLOADED_DIR}"

CMD="${0##*/}"
TMP_DIR=/tmp/"${CMD}"_$$
[ -d "${TMP_DIR}" ] || mkdir "${TMP_DIR}"

# url リストを作成
awk -F, 'NR>1{print $2}' "${DOCUMENT_DIR}"/file_info >"${TMP_DIR}"/urls

# ダウンロードを実行 (既に DL 済みなら重複して DL しない)
wget -w 1 -nc -P "${DOWNLOADED_DIR}" -i "${TMP_DIR}"/urls

# ダウンロード済みファイルリストを作成
find "${DOWNLOADED_DIR}" -type f |
    xargs -n 1 basename |
    tr ' ' '\n' >"${TMP_DIR}"/downloaded_files

# 生成物作成と一次ディレクトリの削除
echo 'ダウンロード済みファイル名' >"${DOCUMENT_DIR}"/downloaded_files
cat "${TMP_DIR}"/downloaded_files >>"${DOCUMENT_DIR}"/downloaded_files
rm -rf "${TMP_DIR}"

exit 0
