
df <- dataframe_list$`tp0307-2as`

# 変数名が適切な形のデータフレームを作成する
 get_graph<- function(df) {
  

  # A:「元ファイルの作成日または更新日」作成
  #日付の取得
  m <- readr::parse_number(basename(dataframe_paths))
  #日付を行数だけ繰り返す
  df <- mutate(df, 元ファイルの作成日または更新日=rep(m[2], nrow(df)))
  
  #B:「区分」はどのファイルも統一されているため加工しない
  
  #C,#D: 「医薬品コード」を「薬価基準収載医薬品コード」に「一般名」を「成分名」に名前を統一
  testlist <- colnames(df)
  colnames(df) <- str_replace_all(testlist,c('一般名' = '成分名', '医薬品コード' = '薬価基準収載医薬品コード'))
  
  #E: 「規格」はどのファイルも統一されているため加工しない
  
  #F: 「品名」に局がある場合の処置
  #if (exists("　局　")) {dataframe_list$tp0305$品名 <- str_sub(dataframe_list$tp0305$品名, 4, )
  #}else{  
  #}
  #dataframe_list$tp0305$品名 <- str_sub(dataframe_list$tp0305$品名, 4, )
  
  df <- 
    select(
      df,
      元ファイルの作成日または更新日,
      区分,
      薬価基準収載医薬品コード,
      成分名,
      規格,
      品名
    )
  return(df)
 }
  
  #変数定義定義関数
 
 
 
 
 
 
 
 
 
 
  # 各変数の型を指定
  # 「元ファイルの作成日または更新日」データファイルによっては、年がないのもあるため、
  # as.factorとas.Dateの二つ記述してあります。
  df$元ファイルの作成日または更新日 <-as.Date(df$元ファイルの作成日または更新日, format = "%Y-%m-%d")
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
