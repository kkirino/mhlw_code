# コードの確認用
path <- "C:\\Users\\sokur\\OneDrive\\ドキュメント\\成育医療\\薬価\\csvファイル"

# library
library(tidyverse)
library(dplyr)

# コードはここから始まります
path <- choose.dir()
dataframe_paths <- list.files(path, full.names = T)

#l(list)applyは、リストごとに実行してというもの
dataframe_list <- lapply(dataframe_paths, read.csv)

# リストに名前を付ける
dataframe_names <- list.files(path, full.names = F) %>% gsub(".csv", "", .)

# dataframe_listの名前を一括にdataframe_namesに変更する。
names(dataframe_list) <- dataframe_names


# csvファイルの読み込み、適切な形のデータフレームを作成する
readfiles <- function(x) {
  df <- read.csv(x,
    header = T,
    fileEncoding = "UTF-8",
    # 文字列をファクター扱いしない
    stringsAsFactors = F,
    # 1行目をスキップ
    # skip = 1
  )

  #dfs <- dataframe_list$tp0305
  #attach(dfs)
  
  
  
  # A:「元ファイルの作成日または更新日」作成
   #日付の取得
  m <- readr::parse_number(basename(dataframe_paths))
   #日付を行数だけ繰り返す
  元ファイルの作成日または更新日 <- rep(m[1], nrow(dataframe_list$tp0305))
   #新しい「元ファイルの作成日または更新日」という変数を作成
  dataframe_list$tp0305$元ファイルの作成日または更新日 <- 元ファイルの作成日または更新日
  
  #B:「区分」はどのファイルも統一されているため加工しない
  
  #C,#D: 「医薬品コード」を「薬価基準収載医薬品コード」に「一般名」を「成分名」に名前を統一
  testlist <- colnames(dataframe_list$`tp0307-2as`)
  colnames(dataframe_list$`tp0307-2as`) <- str_replace_all(testlist,c('一般名' = '成分名', '医薬品コード' = '薬価基準収載医薬品コード'))
  
  #E: 「規格」はどのファイルも統一されているため加工しない
  
  #F: 「品名」に局がある場合の処置
  if (exists("　局　")) {dataframe_list$tp0305$品名 <- str_sub(dataframe_list$tp0305$品名, 4, )
  }else{  
  }
  dataframe_list$tp0305$品名 <- str_sub(dataframe_list$tp0305$品名, 4, )
df <- 
  select(
    dataframe_list$tp0305,
    元ファイルの作成日または更新日,
    区分,
    薬価基準収載医薬品コード,
    成分名,
    規格,
    品名
  )

 

  # 各変数の型を指定
  # 「元ファイルの作成日または更新日」データファイルによっては、年がないのもあるため、
  # as.factorとas.Dateの二つ記述してあります。
  df$元ファイルの作成日または更新日 <- as.factor(df$元ファイルの作成日または更新日)
  df$元ファイルの作成日または更新日 <-
    as.Date(df$元ファイルの作成日または更新日, format = "%Y-%m-%d")
  df$区分 <- as.character(df$区分)
  df$薬価基準収載医薬品コード <- as.numeric(df$薬価基準収載医薬品コード)
  df$成分名 <- as.character(df$区分)
  df$規格 <- as.character(df$規格)
  df$品名 <- as.character(df$品名)

  # 変数の順序を整理する
  dataframe_list$tp03052 %>%
    relocate(元ファイルの作成日または更新日)
  return(df)
}


# ファイルをくっつけていく
df_hoge <- as.data.frame(NULL)
for (i in 1:length(fl)) {
  df <- readfiles(fl[i])
  df_hoge <- rbind(df_hoge, df)
}
df <- as.data.frame(NULL)

## 終了








# 小数点の位置
e <- c(0.3721, 0.8300, 0.24, 0.8)

Amy <- c(
  format(round(e, 2), nsmall = 2)
)


# データフレームの結合
# 今回は、対象とする変数の中で不足のものはないため、以下のコードは使用しない
quickmerge <- function(df1, df2) {
  df1.names <- names(df1)
  df2.names <- names(df2)
  # 【difA <- setdiff(A,B)】Aのみに含まれている文字列を抽出
  df2.add <- setdiff(df1.names, df2.names)
  df1.add <- setdiff(df2.names, df1.names)
  if (length(df2.add) > 0) {
    for (i in 1:length(df2.add)) {
      df2[df2.add[i]] <- NA
    }
  }
  if (length(df1.add) > 0) {
    for (i in 1:length(df1.add)) {
      df1[df1.add[i]] <- NA
    }
  }
  return(rbind(df1, df2))
}
z <- quickmerge(df1, df2)

x <- 10
sq <- dataframe_list$tp0305
