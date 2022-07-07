#!/usr/bin/env bash

if [[ $(uname -a) =~ .*Darwin.* ]]; then
  AWK_BIN="gawk"
  SED_BIN="gsed"
else
  AWK_BIN="awk"
  SED_BIN="sed"
fi

ROOT_DIR="price_calculator"
DATA_FILE="${ROOT_DIR}/data.csv"

$SED_BIN -i.tmp "s/\([0-9]\),\([0-9]*\)/\1.\2/g;s/\"//g" "${DATA_FILE}"
$AWK_BIN -F ',' 'BEGIN {sep=","} {print $1""sep""$2""sep""$3""sep""$4""sep""$5}' "${DATA_FILE}.tmp" > "${DATA_FILE}.tmp2"
$AWK_BIN '{if ($0 ~ "V_ARRAY_PRICING"){system("mdtable '"${DATA_FILE}.tmp2"' 2>/dev/null || :")} else {print $0}}' "${ROOT_DIR}/sizing_pricing.tpl" > "sizing_pricing.md"

rm -rf "${DATA_FILE}".tmp*
