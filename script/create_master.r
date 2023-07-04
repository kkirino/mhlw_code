suppressPackageStartupMessages(library(readr))
suppressPackageStartupMessages(library(readxl))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(stringi))

# script dir, root dir の設定
initial_options <- commandArgs(trailingOnly = FALSE)
script_name <- sub(
  "--file=", "", initial_options[grep("--file=", initial_options)]
)
script_dir <- ifelse(
  length(script_name) == 0,
  getwd(),
  dirname(normalizePath(file.path(getwd(), script_name)))
)
root_dir <- dirname(script_dir)

# 作りかけマスターデータ読み込み
tmp <- read_csv(
  file.path(root_dir, "concatenated/tmp.csv"),
  col_types = cols(.default = col_character())
)

# ファイル定義の読み込みと加工
name_year <- map_df(c("過去ファイル", "現行ファイル"), function(sheet_name) {
  df <- read_xlsx(
    file.path(root_dir, "document/definition.xlsx"),
    sheet = sheet_name
  )
  if (sheet_name == "現行ファイル") {
    df <- df |>
      filter(最新 == 1)
  }
  out <- df |>
    transmute(
      該当年度,
      ファイル名 = basename(ファイルURL)
    )
  return(out)
})

# 内用薬または注射薬は容量に関する情報を取得するため加工する
out <- tmp |>
  filter(区分 %in% c("内用薬", "注射薬")) |>
  left_join(name_year, by = "ファイル名") |>
  select(!ファイル名) |>
  mutate(
    薬価基準収載医薬品コード = stri_trans_nfkc(薬価基準収載医薬品コード),
    規格半角 = str_replace(規格, "，", "") |>
      stri_trans_nfkc() |>
      str_replace_all("[ |　]", ""),
    基準あたり容量 = str_replace(規格半角, "^([0-9.]+).+$", "\\1"),
    単位 = str_replace(規格半角, "^[0-9.]+([^0-9]+).*$", "\\1"),
    基準容量 = if_else(
      str_detect(規格半角, "^[0-9.]+[^0-9]+[0-9.]+[^0-9]+[0-9]+[^0-9]+$"),
      str_replace(規格半角, "^[0-9.]+[^0-9]+[0-9.]+[^0-9]+([0-9]+)[^0-9]+$", "\\1"),
      if_else(
        str_detect(規格半角, "^[0-9.]+[^0-9]+[0-9]+[^0-9]+$"),
        str_replace(規格半角, "^[0-9.]+[^0-9]+([0-9]+)[^0-9]+$", "\\1"),
        NA_character_,
      )
    ),
    基準単位 = if_else(
      str_detect(規格半角, "^[0-9.]+[^0-9]+[0-9.]+[^0-9]+[0-9]+[^0-9]+$"),
      str_replace(規格半角, "^[0-9.]+[^0-9]+[0-9.]+[^0-9]+[0-9]+([^0-9]+)$", "\\1"),
      if_else(
        str_detect(規格半角, "^[0-9.]+[^0-9]+[0-9]+[^0-9]+$"),
        str_replace(規格半角, "^[0-9.]+[^0-9]+[0-9]+([^0-9]+)$", "\\1"),
        NA_character_,
      )
    ),
  )

unit_code_master <- read_csv(
  file.path(root_dir, "unit_code_master.csv"),
  col_names = FALSE,
  col_types = cols(.default = col_character())
) |>
  mutate(X2 = stri_trans_nfkc(X2))

out |>
  left_join(unit_code_master, by = c("基準単位" = "X2")) |>
  filter(is.na(X1) & !is.na(基準単位)) |>
  View()

out |>
  filter(成分名 == "アスピリン") |>
  View()

# 標準出力
write.csv(out, stdout(), row.names = FALSE, quote = FALSE, na = "")

