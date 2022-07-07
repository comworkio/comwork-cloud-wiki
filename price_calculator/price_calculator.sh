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

declare -a SIZES
SIZES=("S" "L" "M" "XL")
echo "#!/usr/bin/env bash" > prices_env.sh
echo "" >> prices_env.sh
echo "## This script is generated, do not update it manually! See: https://gitlab.comwork.io/comwork_public/comwork_cloud/-/blob/main/price_calculator/README.md" >> prices_env.sh
echo "" >> prices_env.sh
for letter in "${SIZES[@]}"; do
  price=$($AWK_BIN -F ',' '($1 == "DEV-'"${letter}"'"){print $4}' "${DATA_FILE}.tmp2")
  echo "export PRICE_DEV1_${letter}=\"${price}\"" >> prices_env.sh
done

rm -rf "${DATA_FILE}".tmp*
