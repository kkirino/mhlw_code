薬価基準収載医薬品コードにもとづき成分名・投与経路・規格が整理・格納された医薬品マスター
================
2023-06-02 (updated: 2023-07-04)

## はじめに

医療用医薬品を成分名・投与経路および規格ごとに分類して目的の医薬品を明確に指定するためには、薬価基準収載医薬品コードが有用である。

薬価基準収載医薬品コードに関する情報は厚生労働省 WEB
サイトにリストとして定期的に掲載されているが、年度毎または薬価改訂/診療報酬改定のたびに更新され、過去の情報がリストより失われる。<br>
長期間にわたるデータベース解析を実施するためには、過去の医療用医薬品をすべてアーカイブしたようなマスターが必要である。

本リポジトリでは、厚生労働省 WEB
サイトより取得可能な公開情報を利用して、薬価基準収載医薬品コードにもとづき医療用医薬品の成分名・投与経路・規格を格納したマスター作製を行う。

## 公開情報の取得

### WEB ページ

厚生労働省 WEB サイト
[医療保険分野のトピックス](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/topics_150856_142.html)
より該当する以下のページリンクを同定し、情報源となるエクセルファイルを取得する。

既存の資料のアーカイブを目的とするため、ページやファイルの更新が終了した
2022 年度までを対象とする。

<table>
<thead>
<tr>
<th style="text-align:right;">
ページID
</th>
<th style="text-align:right;">
掲載開始年度
</th>
<th style="text-align:left;">
ページタイトル
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
2008
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2008/03/tp0307-2.html" style="     " >厚生労働省：平成２０年度診療報酬における後発医薬品について</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
2008
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2008/06/tp0620-1.html" style="     " >厚生労働省：平成20、21年度新たに収載された診療報酬における後発医薬品</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
2010
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2010/03/tp0305-1.html" style="     " >厚生労働省：平成２２年度　診療報酬において加算等の算定対象となる後発医薬品について</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
2010
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2010/04/tp0423-1.html" style="     " >平成22、23年度　診療報酬において加算等の算定対象となる後発医薬品（新規収載分）｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
5
</td>
<td style="text-align:right;">
2012
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2012/04/tp0402-1.html" style="     " >平成２４，２５年度　診療報酬において加算等の算定対象となる後発医薬品(新規収載分)
｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
2014
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2014/03/tp0305-01.html" style="     " >薬価基準収載品目リスト及び後発医薬品に関する情報について（平成28年3月31日まで）｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
7
</td>
<td style="text-align:right;">
2016
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2016/04/tp20160401-01.html" style="     " >薬価基準収載品目リスト及び後発医薬品に関する情報について（平成30年3月31日まで）｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
8
</td>
<td style="text-align:right;">
2018
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2018/04/tp20180401-01.html" style="     " >薬価基準収載品目リスト及び後発医薬品に関する情報について（令和元年9月30日まで）｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
9
</td>
<td style="text-align:right;">
2019
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2019/08/tp20190819-01.html" style="     " >薬価基準収載品目リスト及び後発医薬品に関する情報について（令和2年3月31日まで）｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
10
</td>
<td style="text-align:right;">
2020
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2020/04/tp20200401-01.html" style="     " >薬価基準収載品目リスト及び後発医薬品に関する情報について（令和3年3月31日まで）｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
11
</td>
<td style="text-align:right;">
2021
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2021/04/tp20210401-01.html" style="     " >薬価基準収載品目リスト及び後発医薬品に関する情報について（令和4年3月31日まで）｜厚生労働省</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
12
</td>
<td style="text-align:right;">
2022
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2022/04/tp20220401-01.html" style="     " >薬価基準収載品目リスト及び後発医薬品に関する情報について（令和5年3月31日まで）｜厚生労働省</a>
</td>
</tr>
</tbody>
</table>

### ファイル

上記の WEB ページより以下の過去分の全ファイルをダウンロードする。

<table>
<thead>
<tr>
<th style="text-align:right;">
ページID
</th>
<th style="text-align:right;">
掲載開始年度
</th>
<th style="text-align:left;">
内用薬
</th>
<th style="text-align:left;">
注射薬
</th>
<th style="text-align:left;">
外用薬
</th>
<th style="text-align:left;">
歯科用薬剤
</th>
<th style="text-align:left;">
全区分
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
2008
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2a.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2b.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2c.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2d.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
2008
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2008/06/xls/tp0620-1.xls" style="     " >link</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
2010
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1a.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1b.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1c.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1d.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
2010
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2010/04/xls/tp0423-1.xls" style="     " >link</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
5
</td>
<td style="text-align:right;">
2012
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2012/04/xls/tp0402-1.xls" style="     " >link</a>
</td>
</tr>
<tr>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
2014
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2015/03/xls/tp20151211-01_1.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2015/03/xls/tp20151211-01_2.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2015/03/xls/tp20151211-01_3.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2015/03/xls/tp20150831-01_4.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
7
</td>
<td style="text-align:right;">
2016
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2018/03/xls/tp20180314-01_1.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2017/12/xls/tp20171208-01_2.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2017/12/xls/tp20171208-01_3.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2017/02/xls/tp20170215-01_4.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
8
</td>
<td style="text-align:right;">
2018
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2018/04/xls/tp20190904-01_01.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2018/04/xls/tp20190904-01_02.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2018/04/xls/tp20190904-01_03.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2018/04/xls/tp20180401-01_4.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
9
</td>
<td style="text-align:right;">
2019
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2019/08/xls/tp20200122-01_01.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2019/08/xls/tp20200201-01_02.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2019/08/xls/tp20200122-01_03.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2019/08/xls/tp20191001-01_04.xls" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
10
</td>
<td style="text-align:right;">
2020
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2020/04/xls/tp20210218-01_01.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2020/04/xls/tp20210218-01_02.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2020/04/xls/tp20210218-01_03.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2020/04/xls/tp20201211-01_04.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
11
</td>
<td style="text-align:right;">
2021
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2021/04/xls/tp20220201-01_01.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2021/04/xls/tp20211210-01_02.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2021/04/xls/tp20211210-01_03.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2021/04/xls/tp20211125-01_04.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:right;">
12
</td>
<td style="text-align:right;">
2022
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2022/04/xls/tp20230315-01_01.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2022/04/xls/tp20230315-01_02.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2022/04/xls/tp20230315-01_03.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
<a href="https://www.mhlw.go.jp/topics/2022/04/xls/tp20220420-01_04.xlsx" style="     " >link</a>
</td>
<td style="text-align:left;">
</td>
</tr>
</tbody>
</table>

## データの連結

各ファイルおよびそのメタデータである`掲載開始年度`を、以下の構造となるよう加工する。

| 列番号 | 変数名                   | 型                                  |
|--------|--------------------------|-------------------------------------|
| 1      | 薬価基準収載医薬品コード | 文字列 (6桁の数字+英数字+4桁の数字) |
| 2      | 成分名                   | 文字列                              |
| 3      | 投与経路                 | 文字列                              |
| 4      | 規格                     | 文字列                              |
| 5      | 品名                     | 文字列                              |
| 6      | メーカー名               | 文字列                              |
| 7      | 掲載開始年度             | 整数                                |

## データ加工・クレンジングと検討項目の抽出

- `品名`について、一部のファイルで不要な文字列 (「局」)
  を除く処理を行う。

## 疑義に対する処理

## 運用
