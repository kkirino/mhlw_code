医療用医薬品の投与経路および成分名・規格の対応表作成
================
2023-06-02 (updated: 2023-06-13)

## はじめに

医療用医薬品を投与経路および成分・規格ごとに分類して目的の医薬品を明確に指定するためには、薬価基準収載医薬品コードが有用である。

薬価基準収載医薬品コードに関する情報は厚生労働省 WEB
サイトにリストとして定期的に掲載されているが、年度毎または薬価/診療報酬改定のたびに更新され、過去の情報がリストより失われる。<br>
長期間にわたるデータベース解析を実施するためには、過去の医療用医薬品をすべてアーカイブしたようなマスターが必要である。

本リポジトリでは、厚生労働省 WEB
サイトより取得可能な公開情報を利用して、薬価基準収載医薬品コードと投与経路・成分名および規格のマスター作製を行う。

## 公開情報の取得

### WEB ページ

厚生労働省 WEB サイト
[医療保険分野のトピックス](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/topics_150856_142.html)
より該当する以下のページリンクを同定し、情報源となるエクセルファイルを取得する。

- [平成２０年度診療報酬における後発医薬品について](https://www.mhlw.go.jp/topics/2008/03/tp0307-2.html)
- [平成20、21年度新たに収載された診療報酬における後発医薬品](https://www.mhlw.go.jp/topics/2008/06/tp0620-1.html)
- [平成２２年度　診療報酬において加算等の算定対象となる後発医薬品について](https://www.mhlw.go.jp/topics/2010/03/tp0305-1.html)
- [平成22、23年度　診療報酬において加算等の算定対象となる後発医薬品（新規収載分）](https://www.mhlw.go.jp/topics/2010/04/xls/tp0423-1.xls)
- [平成２４，２５年度　診療報酬において加算等の算定対象となる後発医薬品(新規収載分)](https://www.mhlw.go.jp/topics/2012/04/tp0402-1.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（平成28年3月31日まで）](https://www.mhlw.go.jp/topics/2014/03/tp0305-01.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（平成30年3月31日まで）](https://www.mhlw.go.jp/topics/2016/04/tp20160401-01.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（令和元年9月30日まで）](https://www.mhlw.go.jp/topics/2018/04/tp20180401-01.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（令和2年3月31日まで）](https://www.mhlw.go.jp/topics/2019/08/tp20190819-01.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（令和3年3月31日まで）](https://www.mhlw.go.jp/topics/2020/04/tp20200401-01.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（令和4年3月31日まで）](https://www.mhlw.go.jp/topics/2021/04/tp20210401-01.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（令和5年3月31日まで）](https://www.mhlw.go.jp/topics/2022/04/tp20220401-01.html)
- [薬価基準収載品目リスト及び後発医薬品に関する情報について（令和5年4月1日適用）](https://www.mhlw.go.jp/topics/2023/04/tp20230401-01.html)

### 過去に公開されたファイル

上記の WEB
ページより以下の過去分のファイルをダウンロード・アーカイブし、マスター作成に用いる。

| 該当年度 | ファイル名                                                                               |
|---------:|:-----------------------------------------------------------------------------------------|
|     2008 | [tp0307-2a.xls](https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2a.xls)                 |
|     2008 | [tp0307-2b.xls](https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2b.xls)                 |
|     2008 | [tp0307-2c.xls](https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2c.xls)                 |
|     2008 | [tp0307-2d.xls](https://www.mhlw.go.jp/topics/2008/03/xls/tp0307-2d.xls)                 |
|     2008 | [tp0620-1.xls](https://www.mhlw.go.jp/topics/2008/06/xls/tp0620-1.xls)                   |
|     2010 | [tp0305-1a.xls](https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1a.xls)                 |
|     2010 | [tp0305-1b.xls](https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1b.xls)                 |
|     2010 | [tp0305-1c.xls](https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1c.xls)                 |
|     2010 | [tp0305-1d.xls](https://www.mhlw.go.jp/topics/2010/03/xls/tp0305-1d.xls)                 |
|     2010 | [tp0423-1.xls](https://www.mhlw.go.jp/topics/2010/04/xls/tp0423-1.xls)                   |
|     2012 | [tp0402-1.xls](https://www.mhlw.go.jp/topics/2012/04/xls/tp0402-1.xls)                   |
|     2014 | [tp20151211-01_1.xls](https://www.mhlw.go.jp/topics/2015/03/xls/tp20151211-01_1.xls)     |
|     2014 | [tp20151211-01_2.xls](https://www.mhlw.go.jp/topics/2015/03/xls/tp20151211-01_2.xls)     |
|     2014 | [tp20151211-01_3.xls](https://www.mhlw.go.jp/topics/2015/03/xls/tp20151211-01_3.xls)     |
|     2014 | [tp20150831-01_4.xls](https://www.mhlw.go.jp/topics/2015/03/xls/tp20150831-01_4.xls)     |
|     2016 | [tp20180314-01_1.xls](https://www.mhlw.go.jp/topics/2018/03/xls/tp20180314-01_1.xls)     |
|     2016 | [tp20171208-01_2.xls](https://www.mhlw.go.jp/topics/2017/12/xls/tp20171208-01_2.xls)     |
|     2016 | [tp20171208-01_3.xls](https://www.mhlw.go.jp/topics/2017/12/xls/tp20171208-01_3.xls)     |
|     2016 | [tp20170215-01_4.xls](https://www.mhlw.go.jp/topics/2017/02/xls/tp20170215-01_4.xls)     |
|     2018 | [tp20190904-01_01.xls](https://www.mhlw.go.jp/topics/2018/04/xls/tp20190904-01_01.xls)   |
|     2018 | [tp20190904-01_02.xls](https://www.mhlw.go.jp/topics/2018/04/xls/tp20190904-01_02.xls)   |
|     2018 | [tp20190904-01_03.xls](https://www.mhlw.go.jp/topics/2018/04/xls/tp20190904-01_03.xls)   |
|     2018 | [tp20180401-01_4.xls](https://www.mhlw.go.jp/topics/2018/04/xls/tp20180401-01_4.xls)     |
|     2019 | [tp20200122-01_01.xls](https://www.mhlw.go.jp/topics/2019/08/xls/tp20200122-01_01.xls)   |
|     2019 | [tp20200201-01_02.xls](https://www.mhlw.go.jp/topics/2019/08/xls/tp20200201-01_02.xls)   |
|     2019 | [tp20200122-01_03.xls](https://www.mhlw.go.jp/topics/2019/08/xls/tp20200122-01_03.xls)   |
|     2019 | [tp20191001-01_04.xls](https://www.mhlw.go.jp/topics/2019/08/xls/tp20191001-01_04.xls)   |
|     2020 | [tp20210218-01_01.xlsx](https://www.mhlw.go.jp/topics/2020/04/xls/tp20210218-01_01.xlsx) |
|     2020 | [tp20210218-01_02.xlsx](https://www.mhlw.go.jp/topics/2020/04/xls/tp20210218-01_02.xlsx) |
|     2020 | [tp20210218-01_03.xlsx](https://www.mhlw.go.jp/topics/2020/04/xls/tp20210218-01_03.xlsx) |
|     2020 | [tp20201211-01_04.xlsx](https://www.mhlw.go.jp/topics/2020/04/xls/tp20201211-01_04.xlsx) |
|     2021 | [tp20220201-01_01.xlsx](https://www.mhlw.go.jp/topics/2021/04/xls/tp20220201-01_01.xlsx) |
|     2021 | [tp20211210-01_02.xlsx](https://www.mhlw.go.jp/topics/2021/04/xls/tp20211210-01_02.xlsx) |
|     2021 | [tp20211210-01_03.xlsx](https://www.mhlw.go.jp/topics/2021/04/xls/tp20211210-01_03.xlsx) |
|     2021 | [tp20211125-01_04.xlsx](https://www.mhlw.go.jp/topics/2021/04/xls/tp20211125-01_04.xlsx) |
|     2022 | [tp20230315-01_01.xlsx](https://www.mhlw.go.jp/topics/2022/04/xls/tp20230315-01_01.xlsx) |
|     2022 | [tp20230315-01_02.xlsx](https://www.mhlw.go.jp/topics/2022/04/xls/tp20230315-01_02.xlsx) |
|     2022 | [tp20230315-01_03.xlsx](https://www.mhlw.go.jp/topics/2022/04/xls/tp20230315-01_03.xlsx) |
|     2022 | [tp20220420-01_04.xlsx](https://www.mhlw.go.jp/topics/2022/04/xls/tp20220420-01_04.xlsx) |

### 最新のファイル

本ドキュメント記載時 (2023-06-13) における最新のファイルは下記である。

| 該当年度 | ファイル名                                                                               |
|---------:|:-----------------------------------------------------------------------------------------|
|     2023 | [tp20230601-01_01.xlsx](https://www.mhlw.go.jp/topics/2023/04/xls/tp20230601-01_01.xlsx) |
|     2023 | [tp20230601-01_02.xlsx](https://www.mhlw.go.jp/topics/2023/04/xls/tp20230601-01_02.xlsx) |
|     2023 | [tp20230601-01_03.xlsx](https://www.mhlw.go.jp/topics/2023/04/xls/tp20230601-01_03.xlsx) |
|     2023 | [tp20230401-01_04.xlsx](https://www.mhlw.go.jp/topics/2023/04/xls/tp20230401-01_04.xlsx) |

## データの連結と加工

## 疑義に対する処理

## 運用
