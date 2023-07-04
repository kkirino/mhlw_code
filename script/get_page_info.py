import os
import pandas as pd
from urllib.request import urlopen
from bs4 import BeautifulSoup


script_path = os.path.normpath(os.path.join(os.getcwd(), __file__))
script_dir = os.path.dirname(script_path)
root_dir = os.path.dirname(script_dir)
document_dir = os.path.join(root_dir, "document")

excel_file_path = os.path.join(document_dir, "archive.xlsx")
df = pd.read_excel(excel_file_path, sheet_name="WEBページ")

url_series = df["ページURL"]
title_list = []
for url in url_series:
    res = urlopen(url)
    soup = BeautifulSoup(res.read(), "html.parser")
    title_list.append(soup.title.string)

# 生成物の作成
#
# | 列番号 | 変数名
# |--------|-----------------------------
# | 1      | ページID
# | 2      | 掲載開始年度
# | 3      | ページURL
# | 4      | ページタイトル
#
df["ページタイトル"] = pd.Series(title_list)
df.to_csv(os.path.join(document_dir, "page_info"), index=False)
